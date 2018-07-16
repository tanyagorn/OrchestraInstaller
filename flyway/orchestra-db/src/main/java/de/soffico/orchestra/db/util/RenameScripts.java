package de.soffico.orchestra.db.util;

import java.io.File;

public class RenameScripts {

	public static void main(String[] args) {
		File scriptDir = new File("C:/Users/mst/Desktop/OrchestraDeveloperBoxV1.1/source/SVN_ORCH_TRUNK/orchestra-parent/orchestra-db/src/main/resources/migration/mysql");
		
		String[] list = scriptDir.list();
		
		for (String name: list) {
			if (name.startsWith( "V" )) {
				continue;
			}
			
			File script = new File(scriptDir + "/" + name);
			int underscoreIndex = name.indexOf( "_" );
			String newName = "V" + name.substring( 0, underscoreIndex ) + "_" + name.substring( underscoreIndex, name.length() );
			script.renameTo( new File( scriptDir + "/" + newName )); 
		}
	}
	
}
