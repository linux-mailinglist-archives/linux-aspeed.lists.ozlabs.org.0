Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37311EDA9
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 23:23:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZQDS57T4zDrKd
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Dec 2019 09:23:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZQDC5GMkzDrHY
 for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Dec 2019 09:23:20 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id g18so816687otj.13
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 14:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WFqftU66d4lywk7YGZ8vQ6KoD9czO0JD1+b7jkC8Eqg=;
 b=DLr1b1wfXOB/B26n55FI1KNSFgnwE4sz53diKnRg2YIxq74DgDwtKot3lIVNvDo/Ww
 2lq/ABRSoKQslj01XwcasyddSg4eRhUKeF/emouSIesWecw6L1p1zD9244jo2pvYtaXZ
 /Dn474Deh25uGkkXJr3ZGjLPoo+OFoE04OIdmAd/s5DxynwyV2UHzkRZ6eugraVVwCuL
 dKt1HPZnAo/RrVoXi3j6WGImlt0N/wckVBv8bXR94zKS/8oTVTIwCtVDd0h9TiW3sZM/
 /ksoARPSb+3Zqg9+r4ymV5cgERa+CKBMrBoxKyKdhwRvuhqBekq4xJFcVAYJHxsRa8ZI
 UUaA==
X-Gm-Message-State: APjAAAVdC0Zt8hAPaH1mTzx82fwYxW/JH3yYx1KNaEBFxvdJKOlaffsw
 sgNy2tJRBGJkCWqb7IgH8Q==
X-Google-Smtp-Source: APXvYqy7Ii9i/4Qz6GD0XbnXcIegXItw0XTqvH2+WBespuMeepCyhsU1dWL9fRUGXYM3UeXhG6HziQ==
X-Received: by 2002:a9d:6a8f:: with SMTP id l15mr16702538otq.59.1576275798548; 
 Fri, 13 Dec 2019 14:23:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k5sm3780843otp.33.2019.12.13.14.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 14:23:17 -0800 (PST)
Date: Fri, 13 Dec 2019 16:23:17 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 5/6] dt-bindings: mfd: da9062: add regulator gpio
 enable/disable documentation
Message-ID: <20191213222317.GA32740@bogus>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129172537.31410-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, support.opensource@diasemi.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, broonie@kernel.org,
 kernel@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 29 Nov 2019 18:25:36 +0100, Marco Felsch wrote:
> At the gpio-based regulator enable/disable documentation. This property
> can be applied to each subnode within the 'regulators' node so each
> regulator can be configured differently.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> v3:
> - adapt binding description
> 
>  Documentation/devicetree/bindings/mfd/da9062.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
