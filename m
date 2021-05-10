Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF859378FD6
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 May 2021 16:02:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff2mS5Y3Sz2yy9
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 May 2021 00:02:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff2mM41W4z2yjL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 May 2021 00:01:54 +1000 (AEST)
Received: by mail-ot1-f53.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso14477776otg.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 May 2021 07:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=JKsO3/Ex9MYUNGYvtUUsilRIUDXYRO1OT6ejMhv7T8k=;
 b=sSY9E4oiTMCZEt820Pg58sGqz4a2Ss8sBfm2zZiLSrncy3q2Q+NuBwHJgi5WK6dJho
 DXpC2ZMsBBHBJy6aDybu1RhVDv0nxUCZZ1UuGuyj+0NIJXGdf/2vT6NuYdxFktLKfuhC
 TaGi1HlS72dwLPU4/DDV+eCTn+qB8PQLbgu/+6LuzAPXLJwRmghUqWQgzpzOiCEcBU8n
 wc8/zxUPFM4cc/hpBIjG2zSBaot/i6GeNtb2gszpEWjjtVuI1MGybn09DOQU2TxywvAN
 HCi7+bom8eIt4TgeJigBKRcfWwey37tJxxpkBOxIa2+mfsH6IsUvn8nDZ/8O8aSy7qIG
 O4bA==
X-Gm-Message-State: AOAM533axr8VGkH9OOJ06km7bSp2oHFnvnYEZb8UqiesrlXDyMW4hrg8
 iMTQJoGYv7MO0WnyxPQCrw==
X-Google-Smtp-Source: ABdhPJzkMirGR5MPxh2vUgnso6g9WUTGlKFG5pxnf2yqU3vz/35X9pfPvS3TiXp4ftEr9Ospw50ksA==
X-Received: by 2002:a05:6830:17cb:: with SMTP id
 p11mr22366787ota.283.1620655310131; 
 Mon, 10 May 2021 07:01:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 64sm2648753oob.12.2021.05.10.07.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 07:01:48 -0700 (PDT)
Received: (nullmailer pid 41441 invoked by uid 1000);
 Mon, 10 May 2021 14:01:39 -0000
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20210510073511.7291-2-billy_tsai@aspeedtech.com>
References: <20210510073511.7291-1-billy_tsai@aspeedtech.com>
 <20210510073511.7291-2-billy_tsai@aspeedtech.com>
Subject: Re: [v4 1/2] dt-bindings: Add bindings for aspeed pwm-tach.
Date: Mon, 10 May 2021 09:01:39 -0500
Message-Id: <1620655299.806171.41440.nullmailer@robh.at.kernel.org>
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
Cc: linux-pwm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 p.zabel@pengutronix.de, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 10 May 2021 15:35:10 +0800, Billy Tsai wrote:
> This patch adds device binding for aspeed pwm-tach device which is a
> multi-function device include pwm and tach function and pwm/tach device
> bindings which should be the child-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 66 +++++++++++++++
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 82 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 62 ++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml: Additional properties are not allowed ('child-node' was unexpected)
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml: 'child-node' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml: Additional properties are not allowed ('child-node' was unexpected)
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml: 'child-node' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
schemas/pwm/aspeed,ast2600-pwm.yaml: ignoring, error in schema: 
schemas/hwmon/aspeed,ast2600-tach.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: Additional properties are not allowed ('child-node' was unexpected)
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: 'child-node' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dt.yaml:0:0: /example-0/pwm_tach@1e610000: failed to match any schema with compatible: ['aspeed,ast2600-pwm-tach', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dt.yaml:0:0: /example-0/pwm_tach@1e610000/pwm: failed to match any schema with compatible: ['aspeed,ast2600-pwm']
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dt.yaml:0:0: /example-0/pwm_tach@1e610000/tach: failed to match any schema with compatible: ['aspeed,ast2600-tach']

See https://patchwork.ozlabs.org/patch/1476200

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

