Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A3616B1E
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 18:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Z4X2Lx5z3cJ2
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 04:43:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.173; helo=mail-oi1-f173.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Z4N1lqjz2yxc
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 04:43:30 +1100 (AEDT)
Received: by mail-oi1-f173.google.com with SMTP id n83so19921013oif.11
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9poywl78m8VbboeaIxh9XvxslO7HuQV0K41BEoNBnI=;
        b=bfB6NWgsnh/wwc85ftCtZ04sQsQHMGfaFL4Z9QrlHicRY+PAnxefGkJDTZNMX0/te+
         rAGXqQLd6lNQOxTsLVqZEhz+qeoE3LsQKO8EmPuNxHzVYwV/EMz5HpuACj8AUX4rmNlX
         rX42LvLYikJYmOuEgeUsS9GiPk9jg1y/SzKZIELgXdB9HQ5xuCDOFSmcYeSt0Q1SFlo4
         oQd92KUfR/hQQLu/VplMVR4QafgyqoZyZn/kPzKMRxCXyEi7hTSvboYlXG25Vr1QXZya
         nII7qfj5WD/33WvdhC+ra+YOXGOMnoesY5RxObVC/IOyHSDqnu/TTU8548vlx3wdd+p0
         4nyg==
X-Gm-Message-State: ACrzQf2BktuAPp0F/bcc/FarP/5fz2EinMXGEn+fIizVqVHrlmNWlEtz
	szDNbcHp12zNXJwFkvB+Pg==
X-Google-Smtp-Source: AMsMyM7C49lmmZ/gTiysk0FOySnpKStlXVbXhGF6IF/PgxlF1xZeShB8CXViCLEOlLjjMfpHKM0rdg==
X-Received: by 2002:a05:6808:2203:b0:355:1584:77ca with SMTP id bd3-20020a056808220300b00355158477camr22300871oib.64.1667411007639;
        Wed, 02 Nov 2022 10:43:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b0013ae5246449sm6282686oac.22.2022.11.02.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:43:27 -0700 (PDT)
Received: (nullmailer pid 14800 invoked by uid 1000);
	Wed, 02 Nov 2022 17:43:28 -0000
Date: Wed, 2 Nov 2022 12:43:28 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v3 1/3] dt-bindings: Add bindings for aspeed pwm-tach.
Message-ID: <20221102174328.GA11490-robh@kernel.org>
References: <20221102083601.10456-1-billy_tsai@aspeedtech.com>
 <20221102083601.10456-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102083601.10456-2-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, garnermic@meta.com, jdelvare@suse.com, linux-aspeed@lists.ozlabs.org, linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 04:35:59PM +0800, Billy Tsai wrote:
> This patch adds device binding for aspeed pwm-tach device which is a
> multi-function device include pwm and tach function and pwm/tach device
> bindings which should be the child-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 48 ++++++++++++
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 64 ++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml

Same comment from last version applies. Please don't send new versions 
so quickly before folks have a chance to review or discussions to 
conclude. 1-2 weeks is typical.

Rob
