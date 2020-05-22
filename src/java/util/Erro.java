package util;

import java.io.*;
import java.util.*;

public final class Erro implements Serializable
{
    private final List<String> erros;
    
    public Erro() {
        this.erros = new ArrayList<String>();
    }
    
    public Erro(final String mensagem) {
        (this.erros = new ArrayList<String>()).add(mensagem);
    }
    
    public void add(final String mensagem) {
        this.erros.add(mensagem);
    }
    
    public boolean isExisteErros() {
        return !this.erros.isEmpty();
    }
    
    public List<String> getErros() {
        return this.erros;
    }
}