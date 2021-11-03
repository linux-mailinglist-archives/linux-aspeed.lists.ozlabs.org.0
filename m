Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D245443ADD
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 02:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkTVb26T7z2yHC
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 12:20:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkTVX5hQjz2x9b
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 12:20:50 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id
 p11-20020a9d4e0b000000b0055a5741bff7so1390165otf.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 02 Nov 2021 18:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=fe5Xv+kyJauzq7ZNqvI2QuktA50T37+vjr5WzceAdTw=;
 b=eTLyqOXRJcUz5K/aUnQN4mdcI5Ls2rfvhb+mB5Gg24e3RxjHVU37ozjB4P7kf4bdBm
 yJXLcHB22nQ7KCoNxREiFKOmd0zJAIGpSOBEgkAjgOmkFJJK+UmuKKyUDsUCoEqha0W7
 NEEKr0ht4UxGt7H8rhB/25DEF3E60z5slJTnHZ5PwV0PO+3BQvWMNQ89XqbFyWwMhTwZ
 Q00wNXY5pJ9fw3gxqSsrZsWKrBicPiMEBIsIkTct+2aZSfNiAcZTrqaUUWDlzGQ2/hbk
 bdlUPVy9SZClPZXZ8P8PrtSIQOm96L6iJCxePX8wmQ8Tooy4hY3y8cp5A/j6vq5Z/vXL
 NFvA==
X-Gm-Message-State: AOAM53202UF5de0DlIK+DhazFw8XjSYmY6HCTbynO8bT0lKjO0ch6cbI
 LVyM4TeUNdq/ydaIFhxSoA==
X-Google-Smtp-Source: ABdhPJz012ObTzy65pW0RU2VGVoksQdKqgK4OuppwSTNNNdYMfy9+gVwPH8EccTAzNuAlHk+IzJTig==
X-Received: by 2002:a9d:518a:: with SMTP id y10mr24416564otg.143.1635902446777; 
 Tue, 02 Nov 2021 18:20:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id az10sm166312oib.45.2021.11.02.18.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 18:20:46 -0700 (PDT)
Received: (nullmailer pid 3880389 invoked by uid 1000);
 Wed, 03 Nov 2021 01:20:37 -0000
From: Rob Herring <robh@kernel.org>
To: jae.hyun.yoo@intel.com
In-Reply-To: <20211102203717.96794-6-jae.hyun.yoo@intel.com>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,
 kcs-bmc: add 'clocks' as a required property
Date: Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 02 Nov 2021 13:37:16 -0700, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Add 'clocks' as a required property.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v1 -> v2:
> Changes sinve v1:
>  - Added 'clocks' property into kcs-bmc bindings using
>    'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
>    'aspeed-lpc.yaml' yet. The bindings merging could be done using a
>    separate patch later.
> 
>  .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1549943


kcs@114: 'clocks' is a required property
	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml

kcs@24: 'clocks' is a required property
	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml

kcs@28: 'clocks' is a required property
	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml

kcs@2c: 'clocks' is a required property
	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml

