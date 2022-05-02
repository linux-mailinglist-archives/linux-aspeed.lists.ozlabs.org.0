Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DE75172AB
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 17:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsRvY5W6Bz3bbN
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 May 2022 01:33:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsRvV3psJz3bVH
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 May 2022 01:33:41 +1000 (AEST)
Received: by mail-ot1-f47.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so6879758oty.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 May 2022 08:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=SDazvwLtmD7iGR4/3qNdCTkP7LG5uBpWcYwGTxEc+2A=;
 b=fxjQQw5o/qkNaE6u/+mNY2M+teUEqF/w6Cf33iGw7c7w/NvduMkwSblK/x6Baz1J4D
 xMrswvui3S/nPHSHQW0xIQqAiCz0HpJHCEoE5kZ2gDE4JImAa4SN3Rcr//GuDs+UX0jc
 J5M/509hQYD7DmWMmJ2amcx1RZKLcbcK4GdW5G+450FhOBGXksaFSBFUH9DZePWmDFii
 7CwXI3WMCh2+zcQwcR+T7ZDT4f/laW/fOP9UgtP885ylaAH+PLlUfB6grbZvnuz9sHF3
 pxmvzB+WRBLZD+l2gbMSgrV8P4M76b3OYJh9oxVxmdrT+PXEy3LgNssqreY8PLv3WyXU
 0BMA==
X-Gm-Message-State: AOAM531TCejglZHjY9/4tlrtauJbQxpqo5OodWQei1kOzqCKBZsO9OLu
 GGQ+dGmompn2scVqw4YjhQ==
X-Google-Smtp-Source: ABdhPJyxhjWaL+KKrChyj8rFPZzTPAip2KUS5CJwmjTl5l+jgv7N6SL8bT0V7zetu7j4JXX4QkkOKg==
X-Received: by 2002:a9d:491c:0:b0:605:c207:1f6b with SMTP id
 e28-20020a9d491c000000b00605c2071f6bmr4416443otf.41.1651505617521; 
 Mon, 02 May 2022 08:33:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a11-20020a4a9b0b000000b0035ec65ac944sm3482696ook.16.2022.05.02.08.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:33:37 -0700 (PDT)
Received: (nullmailer pid 1161769 invoked by uid 1000);
 Mon, 02 May 2022 15:33:29 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220502081341.203369-3-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
 <20220502081341.203369-3-clg@kaod.org>
Subject: Re: [PATCH v5 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Date: Mon, 02 May 2022 10:33:29 -0500
Message-Id: <1651505609.452113.1161768.nullmailer@robh.at.kernel.org>
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 02 May 2022 10:13:32 +0200, Cédric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>
> Tested-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml:62:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 52, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 49, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 62, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml:  while scanning a block scalar
  in "<unicode string>", line 49, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 62, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml: ignoring, error parsing file
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

