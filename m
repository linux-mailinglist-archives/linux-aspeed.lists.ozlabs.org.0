Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DDD3892A7
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 May 2021 17:30:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlcJ6686dz301p
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 May 2021 01:30:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlcHK38P9z2xZS;
 Thu, 20 May 2021 01:29:33 +1000 (AEST)
Received: by mail-ot1-f47.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so4259253otg.9; 
 Wed, 19 May 2021 08:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=k1BMeUTbeJ1Ojj2Y28GjLMZTtvIHgmmwd90fSboA3i0=;
 b=Fxn+mC2PXwhkPX0zq9mO2l48PHV6Emqk2Q0Odym6KhKt5/lQqP8hmwjIXg6h7+L7iv
 PPN+Q5e6GAwA8bY//Jw+94VrIHQM+tCrONUWN+BGbCSwQAcy0E8HWXzhxvpOxbIxPj7E
 yVFft9Nj1brWnymKTHzPZ7Rauc5A0FXHQJfMh7p6muW18GgjV4m4ahs0j6CFlhVtlU55
 5cFauoUSQuyWH7U/4Ku3An3bawJpaim+06RdkaEtjtglAR52d4Arut5vQXyMW3aDWchq
 F+HOEfIHUUgg93OpLlFqbWQZEHOdrBRE/PIlx79kVfT4bzFSQ3U8st9YwEisrz7XqG0t
 71Ew==
X-Gm-Message-State: AOAM5338uJsVH4RKl0zD5DEwI9vvLkBZOQDhl4tYhLVwyu+K39dHRRf4
 PnRIB6Z9cmDlTtMFgFpYJw==
X-Google-Smtp-Source: ABdhPJzfHwRubC4A+GJbwqXIPluC9VWdzE3LtUHkth8w8OcmezXF1dBV+tE1V5FeZG+SaSCglQKYiQ==
X-Received: by 2002:a9d:58c1:: with SMTP id s1mr9206990oth.361.1621438170894; 
 Wed, 19 May 2021 08:29:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r124sm4101937oig.38.2021.05.19.08.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:29:30 -0700 (PDT)
Received: (nullmailer pid 3134234 invoked by uid 1000);
 Wed, 19 May 2021 15:29:24 -0000
From: Rob Herring <robh@kernel.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>
In-Reply-To: <20210519080436.18975-4-jamin_lin@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-4-jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed-i2c: Convert txt to yaml format
Date: Wed, 19 May 2021 10:29:24 -0500
Message-Id: <1621438164.132520.3134233.nullmailer@robh.at.kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, steven_lee@aspeedtech.com,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rayn Chen <rayn_chen@aspeedtech.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 19 May 2021 16:04:29 +0800, Jamin Lin wrote:
> Add global-reg node for AST2600. Document the properties for
> "aspeed,ast2600-i2c-global" compatible node.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 89 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ----------
>  2 files changed, 89 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dt.yaml:0:0: /example-0/i2c-global-regs@0: failed to match any schema with compatible: ['aspeed,ast2600-i2c-global', 'syscon']

See https://patchwork.ozlabs.org/patch/1480769

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

