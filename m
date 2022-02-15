Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BBB4B74D4
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 20:49:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jys9n4L1Tz3cLN
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 06:49:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jys9g3Fbtz3c5j
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 06:49:25 +1100 (AEDT)
Received: by mail-io1-f44.google.com with SMTP id e79so25206783iof.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 11:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=KXSZwObXwXhyqBUgs8Dj2mGzNepAgJtQoKeKbytKAUc=;
 b=2wTQQpImSMBIID9bWDkRCYqhtPVznATspdkA1nWyKZXTmjNYASO1mB6gb8AERaahL7
 F9wbd3Fm6s0GueE0bjy53wvazSRAKuTKj2/Rq+n4k6EW8zZdrBpOi5o3j8+yLpfSl3z7
 7sJmORDfrv78Du21GsNtfLv8tHpuR5qTfVoy7pw30EIVC9ZpbSIQNVEsXwF0+bVoFPma
 3zRl/GIzfBfud7ZQ5491bFKZ9FdszT+WYlcvoDjPma1qh599E9hvQ/d6i5KWMgdK6Wiy
 /Xo5o/IsLMbhU+4rNL9tT6CLhjaf0pUIi6W5PrBgVv2KJUjhT11s13vySm2LcNMUokjW
 9a5Q==
X-Gm-Message-State: AOAM532X+o8UI8OSblEga+k4K+Tda2gU2hPcscBG/aMY93/hDC/Qa5Z1
 iJ3wfcDUGUSWah8wqAB5Zw==
X-Google-Smtp-Source: ABdhPJw4dH7aOt4PpzLwO7VCfIbho2N2cLTRW+nmzH1+8BgDGfbcmPlRXiw84CD6uvuop7GaxBvJ4Q==
X-Received: by 2002:a05:6638:37a1:: with SMTP id
 w33mr301609jal.73.1644954560908; 
 Tue, 15 Feb 2022 11:49:20 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h12sm6014113ild.44.2022.02.15.11.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:49:20 -0800 (PST)
Received: (nullmailer pid 3813672 invoked by uid 1000);
 Tue, 15 Feb 2022 19:49:18 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220214094231.3753686-3-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-3-clg@kaod.org>
Subject: Re: [PATCH 02/10] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Tue, 15 Feb 2022 13:49:18 -0600
Message-Id: <1644954558.088844.3813671.nullmailer@robh.at.kernel.org>
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
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 10:42:23 +0100, Cédric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dt.yaml: example-0: spi@1e620000:reg:0: [509739008, 196, 536870912, 268435456] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dt.yaml: spi@1e620000: reg: [[509739008, 196, 536870912, 268435456]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1592369

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

