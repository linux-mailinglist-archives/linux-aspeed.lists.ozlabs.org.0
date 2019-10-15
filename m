Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B5D8393
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 00:24:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t92g1kBHzDr6x
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 09:24:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t92X3LQzzDr69
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 09:24:19 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id t84so18286976oih.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2019 15:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nK0aavkV2vBesQcv0AgqoDNcvg469f2OzuJk5GeXGKE=;
 b=lr2jJjWlw8qUKtda9jPOdjYKEBVBrdkqSRN6PppwDGizwnUFwfNaPjBY1L1x45hoHk
 PnHEsepwbo9hfMF0q5te0d59e9hy5ABz22aXduOmwEwpsu5V9Ra/VvG9APhXOdrblNN+
 e2T0Ja17BoS52Q2jGl0rhqLTrcfZ41TQOKN1sTNRaDoC8zXpWwfrDrD5g5whzNjSvoZA
 XzRHehM5gD4Y0i7uwBq5kcPg1wyX4awCY/UnoWGMjHB8l5iUzEPh1UE9R+jJgRgG6ZDk
 e0d4bJ5RVqpnUwbAqmvaZgXrwUVYDyHWLJhEI43+cPMDgI0vXXKxa49OCjrQIG4h74kZ
 SsWw==
X-Gm-Message-State: APjAAAWuAMAPM4DxI0sjtHvOiFIYQIw4fyGJkND5SuIBc3/jbmMeGFgN
 3scn1YXU697BaAdqBMB6ZA==
X-Google-Smtp-Source: APXvYqw2zlzetx+asQEISLHCoq9N6nsXVVk1APE2KhuoS0Weh/DxpADYhOg0xmTVQQw+4Z3eMZTbng==
X-Received: by 2002:aca:3b84:: with SMTP id i126mr785946oia.28.1571178256967; 
 Tue, 15 Oct 2019 15:24:16 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m20sm6622503oih.43.2019.10.15.15.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 15:24:16 -0700 (PDT)
Date: Tue, 15 Oct 2019 17:24:15 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: aspeed-g6: Rework SD3 function
 and groups
Message-ID: <20191015222415.GA10977@bogus>
References: <20191008044153.12734-1-andrew@aj.id.au>
 <20191008044153.12734-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008044153.12734-2-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue,  8 Oct 2019 15:11:47 +1030, Andrew Jeffery wrote:
> Rename SD3 functions and groups to EMMC to better reflect their intended
> use before the binding escapes too far into the wild. Also clean up the
> SD3 pin groups to eliminate some silliness that slipped through the
> cracks (SD3DAT[4-7]) by unifying them into three new groups: EMMCG1,
> EMMCG4 and EMMCG8 for 1, 4 and 8-bit data buses respectively.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Unfortunately reflowing the list creates a lot of noise in this change. As
> mentioned the SD3DAT[4-7] groups are renamed, as is the SD3 function. There
> should be no functional changes beyond that.
> 
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 86 +++++++++----------
>  1 file changed, 42 insertions(+), 44 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
