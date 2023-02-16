Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3560699677
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 14:59:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHc4X4ZNxz3cjQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 00:59:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHc4P36t1z2yPY
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 00:58:59 +1100 (AEDT)
Received: by mail-oi1-f169.google.com with SMTP id t5so1742134oiw.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 05:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ViCQNNU/x441WaeFAdW3KxGJXeuOAm5VDmC6mRNH38=;
        b=TN4wEoEZlyVKQbFBkqfXfwU3fHv704dXowT2Wu1UXSyzEYsIQnDAs0utp2Vx5V2U/p
         DERMiZXZYtRy9XvGuh/ktCawA4qfGxqbLH7C2fsmkQw2IqHYwO0AueQRjehD1J1sP7BB
         eBg5I57Q6GdQTOahTpETjJk7JWqWrLix/0/qUAfSpyMO88clUqnsv/G37S1TS7g09gjp
         OrKGTav01s0c3EKRvp1RaP38hmGn/KXBWY22bTMukMiGDsiOUht8IjpibvbcasjGWit8
         Soow4/nx9oFdTgAIYcaD0SYwz2NpecYgkBHv/nIvpCvaGZVgep9Ns+mCCfmiV5tKSRu1
         OU1Q==
X-Gm-Message-State: AO0yUKVwES18HUVvYCFv0XQ1wW4+eRgy7hCrOpXdF/reOyLwBmUQohQH
	3t9oTZcj5ZbHXha18l35QA==
X-Google-Smtp-Source: AK7set9+niocv5iHjmV2FG/y98pgRCFH2p2yv+ry0Fn7siDHXOUJyBElG7qV3ToHWtp0pb59Wz8ocA==
X-Received: by 2002:aca:1e0f:0:b0:364:f5da:54b7 with SMTP id m15-20020aca1e0f000000b00364f5da54b7mr2478772oic.36.1676555934095;
        Thu, 16 Feb 2023 05:58:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n23-20020aca2417000000b0037d8dbe4308sm546196oic.48.2023.02.16.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:58:53 -0800 (PST)
Received: (nullmailer pid 2312585 invoked by uid 1000);
	Thu, 16 Feb 2023 13:58:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
In-Reply-To: <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
 <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
Message-Id: <167655476600.2292444.1311837457935007933.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: i3c: Add AST2600 i3c controller
Date: Thu, 16 Feb 2023 07:58:52 -0600
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 16 Feb 2023 15:41:52 +0800, Jeremy Kerr wrote:
> Add a devicetree binding for the ast2600 i3c controller hardware. This
> is heavily based on the designware i3c core, plus a reset facility
> and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - aspeed,global-regs: to reference the (ast2600-specific) i3c global
>    register block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> ---
> changes from RFC:
>  - add vendor prefix to global-regs properties
>  - add item description on global-regs property
>  - drop global reg node from example
> ---
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.example.dts:30.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

