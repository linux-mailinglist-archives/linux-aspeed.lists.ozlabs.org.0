Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B107E723F6D
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 12:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb69k3lzdz3f0T
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 20:27:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.52; helo=mail-io1-f52.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb69c3Njnz3ds9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 20:27:31 +1000 (AEST)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7748d634a70so229920739f.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047248; x=1688639248;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAPwM9u2F/Ud8Dzoq+JTM/HoPHsb9s153yZMWbPc3GE=;
        b=FAPyQ23mzDGCAz7+dueIu88lvLd/hW/NfedYzxabNvz2Y+51ZVfK4Kh+amjaEOsze0
         cSZCzQeiR/vxanO65R0VTcE42Ss+ApLtcu3Uo4kwMy3ceZhacjje8SORCrVl+5URnNxf
         dQ0DesvaIF+33MyAtdb2tWZTe0uV5gOTj9wIWt0QQqPE3N7pX0cEsNB6PLuri9537SSG
         LPpMrR6QDUhWhxBBGME4kzVxYNh4ouPd6fJMbWWKG8KyMdLXbQuDAvR/TG/FheW4qP5b
         eZ+Eb/+RiXrpx+UApgGzIs9+uIqK+vORjBIOZWMe2dfOUKRMX9sIAtMKaXGnBHFJEnuY
         70YQ==
X-Gm-Message-State: AC+VfDzELhtYFToR8No72ghmccvdt3b012BYeu04QhZ+P0LTRE/XvWUy
	Yh0TMvV6Lk67NUC3pdHMsw==
X-Google-Smtp-Source: ACHHUZ68E0V6jIRjSy2wh4tmUQtFk1OPqANyFaBsAC3f1lK9fAcvLfnZ2Yb+yr9jd5qlQIhh7Sju9w==
X-Received: by 2002:a5d:9544:0:b0:775:8241:724a with SMTP id a4-20020a5d9544000000b007758241724amr1726719ios.16.1686047247601;
        Tue, 06 Jun 2023 03:27:27 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o22-20020a02c6b6000000b00408df9534c9sm2670058jan.130.2023.06.06.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:27:26 -0700 (PDT)
Received: (nullmailer pid 411520 invoked by uid 1000);
	Tue, 06 Jun 2023 10:27:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20230606094535.5388-4-billy_tsai@aspeedtech.com>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
Message-Id: <168604724448.411496.12229634069665354962.robh@kernel.org>
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Date: Tue, 06 Jun 2023 04:27:24 -0600
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, patrick@stwcx.xyz, robh+dt@kernel.org, linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com, corbet@lwn.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 06 Jun 2023 17:45:33 +0800, Billy Tsai wrote:
> Add device binding for aspeed pwm-tach device which is a multi-function
> device include pwm and tach function.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dts:37.15-28: Warning (reg_format): /example-0/pwm-tach@1e610000/tach/fan@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dts:36.19-38.15: Warning (avoid_default_addr_size): /example-0/pwm-tach@1e610000/tach/fan@0: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dts:36.19-38.15: Warning (avoid_default_addr_size): /example-0/pwm-tach@1e610000/tach/fan@0: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606094535.5388-4-billy_tsai@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

