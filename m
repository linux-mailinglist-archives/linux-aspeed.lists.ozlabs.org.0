Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298D6362CD
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 16:07:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHPcj0p6rz3f2w
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Nov 2022 02:07:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.53; helo=mail-io1-f53.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHPcc5Vpyz3cKb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Nov 2022 02:07:28 +1100 (AEDT)
Received: by mail-io1-f53.google.com with SMTP id d123so13333377iof.7
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 07:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLETIKJccRyPQMJ8KCnoTh6vcUSTK9D/bxKP76WIm5E=;
        b=COAq4OqEAW2GUn3Gg0Qhmz514xeJtEEeZGj6dUD79fOGBO3c2cD9//aDpvz08QC4Ld
         DPaaf7dqqR7lTUttpOh5z3FmkKe842u/ANVBh/eE9zOFkBFlcLGmmKsrAyM5/52/fQgw
         /8n3OMzhEKOaKZp2lbwFaAEpPGdKEzmpBZq+RCYsrMwXZwt4fDBuZhRdVLjb6/9tzp07
         FSSuhuds1lDwBW1/4acsnfpXuWXCx8TyydlUdO/h1XEG/1emF6MSSYYwizY3xgxZXrwe
         k77ztwyDifVAQ3GyacetsZmXgf8mdSmOOlWFTqnWSdOuDodtvmq8TZRPBgiVwiuGKHiV
         npEA==
X-Gm-Message-State: ANoB5pkDUpS24yBF0A24LCvmm0cHjSnRqdPvdQUlYKVCXAUIuufcaou4
	fcVwp6UjyRWhY2PE4x5sPQ==
X-Google-Smtp-Source: AA0mqf4SUiWT+J/qqCxyaqKJMFnZAZA1PuepXjokI4v31dpgrcg6c4htmrUB1sb3P085pAcWl8zOCg==
X-Received: by 2002:a5e:840f:0:b0:6dd:2127:50b9 with SMTP id h15-20020a5e840f000000b006dd212750b9mr5818301ioj.120.1669216046145;
        Wed, 23 Nov 2022 07:07:26 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z7-20020a05663822a700b003752e5b3c23sm6353811jas.20.2022.11.23.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:07:25 -0800 (PST)
Received: (nullmailer pid 2005411 invoked by uid 1000);
	Wed, 23 Nov 2022 15:07:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20221123061635.32025-3-billy_tsai@aspeedtech.com>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-3-billy_tsai@aspeedtech.com>
Message-Id: <166921592652.2001911.517272119608827476.robh@kernel.org>
Subject: Re: [v4 2/5] dt-bindings: pwm: Add bindings for aspeed pwm controller
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 23 Nov 2022 14:16:32 +0800, Billy Tsai wrote:
> Add the aspeed pwm device bindings which should be the child-node of
> pwm-tach mfd.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: patternProperties:^pwm@[a-z0-9]+$:properties:aspeed,wdt-reload-duty-point: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maximum', 'minimum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: patternProperties:^pwm@[a-z0-9]+$:properties:aspeed,wdt-reload-duty-point: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: patternProperties:^pwm@[a-z0-9]+$:properties:aspeed,wdt-reload-duty-point: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221123061635.32025-3-billy_tsai@aspeedtech.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

