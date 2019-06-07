Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A373989C
	for <lists+linux-aspeed@lfdr.de>; Sat,  8 Jun 2019 00:26:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LHDX0Rz5zDqT6
	for <lists+linux-aspeed@lfdr.de>; Sat,  8 Jun 2019 08:26:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="YoToUoWc"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LHCs546TzDqMX
 for <linux-aspeed@lists.ozlabs.org>; Sat,  8 Jun 2019 08:25:29 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id u10so2706870lfm.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 07 Jun 2019 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rGW8Zw9vrerYLKuQT2nRCi+4sph/YuDXDjL6O2OUlyY=;
 b=YoToUoWcx3852gvqkcDqaAMEmvxpkHkiUSN4e9zc8dZ3goxm71AXrawyITaIP5GLLS
 rx8hYH26Xwb+TFFur666Px//Tfwd4vaFmukaXEVxWybwGOTaBZBGIruWs4fpO789FIy6
 AHnYYBcAvstBHMkkTugoQ3vKfE+mGkEWW0d2EV8/DQkiXnUerfubSJdBuU70KlkB2QLa
 HB7QXW6NkYRO8/wG9fo4DrzI2En8SOVEcua2UQk/+9wJ4XDCsURRpCMV2n112gAgRjt/
 g+Wd1S1krdN31vYrT3InbPW9RpSg4p1pHwLs1HVgEEfY/NHDHfgty7gAJ/Au1Rlud4qS
 sDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rGW8Zw9vrerYLKuQT2nRCi+4sph/YuDXDjL6O2OUlyY=;
 b=VKXSrEBt7lsikn1vQqphSSF+Cp+axP/3YFq2ADTgvMr9rnFWx8iUFeQuPkviZHVlPb
 02OaQhSLHbplbUa+0NSRZcnBj0OTxiOFf2RV7euR0/ZgIny69F6RjJ3fRN5noR6/iQle
 9QKsu6yVA7RZD1b24QvQ6Q18qC7kqV9Yc8kXmpxalGy1D75Gju0AIe5B3WXpAKybtI21
 2d0eHE9H7i4vdQLMOqa3/YFQd4Yw+hExRcCszmpqsscFZf7Gw8AHU1LSMevVGLj1z7Ln
 5QIc9CJxPlzdjJykOvH1+0opv7czADN/2DbrxotrdbK2EEj0ZiEhTUxy1SUcuxGyyzay
 zc/A==
X-Gm-Message-State: APjAAAVkCNz7Wjvy+HoaJFfyBK8tYvuPI3MaozfMuvKwp/uzDrmbi95U
 xwFUwVDRG+xb9OU2Posa21D2UN5Ewh+kIxm5MRv1FA==
X-Google-Smtp-Source: APXvYqxNvBh6hAcA49cetya1d7GzlkGbHULmzKnolLcB2hj9KdHRpewtAF6MLQb+nLBB50KHLqayPIOHqmuTwhkTOL0=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr14458737lfm.61.1559946324431; 
 Fri, 07 Jun 2019 15:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <1559684524-15583-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559684524-15583-1-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 8 Jun 2019 00:25:16 +0200
Message-ID: <CACRpkdYW3rezzJ3XAuuSNNsRiDh9nYNL8NNFjaZ=_NeXrmZbqA@mail.gmail.com>
Subject: Re: [PATCH 1/3 linux dev-5.1 arm/soc v2] ARM: dts: aspeed: Add SGPM
 pinmux
To: Hongwei Zhang <hongweiz@ami.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 11:42 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this part of the patch through the ARM SoC
tree. I guess Joel will queue this?

Yours,
Linus Walleij
