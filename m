Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D3D6362CC
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 16:07:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHPcf4Bptz3dvF
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Nov 2022 02:07:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.50; helo=mail-io1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHPcZ60K5z2xG6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Nov 2022 02:07:26 +1100 (AEDT)
Received: by mail-io1-f50.google.com with SMTP id z3so13339362iof.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 07:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mEKRRENqRMYufrIxQe5nh4pku7YdsEXR7GLENp5qxds=;
        b=dfMy1XWoBcjkyjK4ei3Q+VijcljnyFJTuanaQRKkslFeL2lxp4ZIxuUPYtQjDh2KNN
         6inTg4nK775YpovAkfnOdljtFanb9OtL1ogbTPY+IW5cLn1QLqlGhXuFBmkva1PcBP6J
         z4DaZBQSr8C7qksku012TBlzI06jgp1zBWtP1XDdm3I8kvvN5+RfvNJODl3IqTcT1iL4
         jPLlQDNs9xBouoIb5Wd29nRDKzfubZwZ5PtqZIujL2NuxnGSoeNz5PQpxaSLoDa2mZ9A
         t3hx7J+KFru2Kup4edA4CLPvRmGncQioF7h173R2aKvLE9WBhtnhkzsyrHfXMhBy/Lal
         hgWQ==
X-Gm-Message-State: ANoB5pn0WODyOjS/mw0h3CbRd3gguTMeYoTfp1A5GUMZjK7UKMOVzxh7
	4KiYzVGOWilVs/CLoCqf7w==
X-Google-Smtp-Source: AA0mqf5WEOGwgDMNRRrW1Nl5ZZQrwr9oGk58/ul6P+DcjJ/FKrD+KR+qn5EypzZ/kztelu0r7NW1nA==
X-Received: by 2002:a5e:8302:0:b0:6de:4dce:37ef with SMTP id x2-20020a5e8302000000b006de4dce37efmr4093910iom.68.1669216043222;
        Wed, 23 Nov 2022 07:07:23 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u28-20020a02cbdc000000b003757ab96c08sm6561820jaq.67.2022.11.23.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:07:22 -0800 (PST)
Received: (nullmailer pid 2005408 invoked by uid 1000);
	Wed, 23 Nov 2022 15:07:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20221123061635.32025-2-billy_tsai@aspeedtech.com>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-2-billy_tsai@aspeedtech.com>
Message-Id: <166921592541.2001852.8427859391374590200.robh@kernel.org>
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Date: Wed, 23 Nov 2022 09:07:21 -0600
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, corbet@lwn.net, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 23 Nov 2022 14:16:31 +0800, Billy Tsai wrote:
> Add device binding for aspeed pwm-tach device which is a multi-function
> device include pwm and tach function.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/pwm/aspeed,ast2600-pwm.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: pwm-tach@1e610000: pwm: False schema does not allow {'compatible': ['aspeed,ast2600-pwm'], '#pwm-cells': [[3]], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb: pwm-tach@1e610000: tach: False schema does not allow {'compatible': ['aspeed,ast2600-tach'], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb:0:0: /example-0/pwm-tach@1e610000/pwm: failed to match any schema with compatible: ['aspeed,ast2600-pwm']
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dtb:0:0: /example-0/pwm-tach@1e610000/tach: failed to match any schema with compatible: ['aspeed,ast2600-tach']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221123061635.32025-2-billy_tsai@aspeedtech.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

