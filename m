Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871D3EDE6E
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Aug 2021 22:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpQDk5gSNz2yxx
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Aug 2021 06:07:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.171;
 helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpQDc38b2z2yP3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Aug 2021 06:07:11 +1000 (AEST)
Received: by mail-oi1-f171.google.com with SMTP id u25so28439145oiv.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Aug 2021 13:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=uHtjUONg6FCY3pnZJevLSPNM0uWf/2eId9QZ5tVSivw=;
 b=aNvReT18NHokXWX/CvxWYO3WDVtTvd3aDKlTIGl8iQ9YYy5FM5tuqVbjJJOZSEde+1
 F344YFcsbjQY7t8atZ5J3TP7iJYySh6GnhjcXhk0smvQm8TjjoRUWE3aK+Zp3ecTCUnK
 hOHQPtJn2HotW68kNULOSbx0tvcc8gNfUzCWG81vee3IZ7RdyWJXk59vtBjGGmop89jE
 Jr0IIlN+mZUwTWic0cWZJMTBHh5pzrQUeuTYwI8G8jhCSh3iQ32iT8uqt7RSo8a+txj9
 5usIBft34NH0uixKZ9aM7xAgaIS8o/9HktNcs/QAmzsfG1qi/tQ3L/DRAsLXRELGNhdK
 z8yg==
X-Gm-Message-State: AOAM532UHJ3kqEClMrXSja2Ck9G+frE5rqCbsx6E5MMuPACGcMsCGO50
 uLiT/4YUGLnALweLWZ7DgQ==
X-Google-Smtp-Source: ABdhPJwPoLDRQz/e37Bg6ivbukWiCoD/59uOvrNG7ZaBLascqxFx2/JD5NsoIT8X2Em6vbYg4dR/Pw==
X-Received: by 2002:a05:6808:2084:: with SMTP id
 s4mr383200oiw.31.1629144427275; 
 Mon, 16 Aug 2021 13:07:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm4019ooa.35.2021.08.16.13.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:07:06 -0700 (PDT)
Received: (nullmailer pid 2563335 invoked by uid 1000);
 Mon, 16 Aug 2021 20:07:03 -0000
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20210816104846.13155-2-billy_tsai@aspeedtech.com>
References: <20210816104846.13155-1-billy_tsai@aspeedtech.com>
 <20210816104846.13155-2-billy_tsai@aspeedtech.com>
Subject: Re: [v3 01/15] dt-bindings: iio: adc: Add ast2600-adc bindings
Date: Mon, 16 Aug 2021 15:07:03 -0500
Message-Id: <1629144423.392245.2563334.nullmailer@robh.at.kernel.org>
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
Cc: BMC-SW@aspeedtech.com, lars@metafoo.de, jic23@kernel.org, pmeerw@pmeerw.net,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, linux-iio@vger.kernel.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 16 Aug 2021 18:48:32 +0800, Billy Tsai wrote:
> Add device tree bindings document for the aspeed ast2600 adc device
> driver.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml  | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml: properties:aspeed,int_vref_mv: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('enum' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml: properties:aspeed,int_vref_mv: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	1200 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	2500 is not of type 'string'
		hint: A vendor string property with exact values has an implicit type
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml: ignoring, error in schema: properties: aspeed,int_vref_mv
warning: no schema found in file: ./Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.example.dt.yaml:0:0: /example-0/adc@1e6e9000: failed to match any schema with compatible: ['aspeed,ast2600-adc0']
Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.example.dt.yaml:0:0: /example-0/adc@1e6e9100: failed to match any schema with compatible: ['aspeed,ast2600-adc1']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1517123

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

