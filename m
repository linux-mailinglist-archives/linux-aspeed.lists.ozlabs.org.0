Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDBA4CD7C5
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 16:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9BbX2cYJz30L1
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Mar 2022 02:29:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.42; helo=mail-oo1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9BbR0Rngz2yPF
 for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Mar 2022 02:29:06 +1100 (AEDT)
Received: by mail-oo1-f42.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso9746594ooc.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 04 Mar 2022 07:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=J5ioJmCSVVWCtbo+u6o5MHD3cE9Z/JYc9eT4jBLaSTU=;
 b=6DfFY21tXf114lHWidkEvzvtAoWnOqPPJGROdHCJSVnu1ly7gQudpwGRAz/HQfYQaU
 5NLEQZQ1uMJxwTCwJP7odIfZFwJlDp9Ku+Ffx48dnoVHZyu7BYxL/SGbvqvcxbLLC+Jw
 2i4ZLSt9pzu1OdvI0XaR67ADINyNdyvnTx8Ig/Wolu33zF1M9vELOeXXp3Ydw+mD92IC
 t2/Hc2LbExA0tyx4ng/24IOVeJdHPg3rqmFiomCbBmykaBSuutsLMjNASQFl7Hk8uECs
 rkuCldGMcciDOor+6aA1u825qwJTAU9Hax6tSb7172zBFLCjTASkVvXDHYYY19IK5gEU
 KTNA==
X-Gm-Message-State: AOAM531MCB8VIN8MjYMa/894R0jqYQ0lnmXX9Ez0zPN6T3Jk5D+gfFpD
 Eujl5LWFOnK3+j3B7WokYQ==
X-Google-Smtp-Source: ABdhPJxuZOHatViaL6tiAhK4OShzYUiPIoRUY4TN0tNXWjvpW9YkoKjUjPortO9oOaQCOPdVHFxMNg==
X-Received: by 2002:a05:6870:a406:b0:d9:b303:7dc2 with SMTP id
 m6-20020a056870a40600b000d9b3037dc2mr6864276oal.23.1646407742846; 
 Fri, 04 Mar 2022 07:29:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e3-20020a056870c34300b000d9d83493bfsm590564oak.8.2022.03.04.07.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:29:02 -0800 (PST)
Received: (nullmailer pid 3970571 invoked by uid 1000);
 Fri, 04 Mar 2022 15:29:01 -0000
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
In-Reply-To: <20220304000311.970267-3-joel@jms.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-3-joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to
 yaml
Date: Fri, 04 Mar 2022 09:29:01 -0600
Message-Id: <1646407741.272520.3970570.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 04 Mar 2022 10:33:11 +1030, Joel Stanley wrote:
> Convert the bindings to yaml and add the ast2600 compatible string.
> 
> The legacy mfd description was put in place before the gfx bindings
> existed, to document the compatible that is used in the pinctrl
> bindings.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>  .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
>  3 files changed, 69 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1600723


display@1e6e6000: 'memory-region' is a required property
	arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-opp-zaius.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dt.yaml

