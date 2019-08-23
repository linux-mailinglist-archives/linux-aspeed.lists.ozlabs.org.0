Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320999AB87
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2019 11:42:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FGdp6ZzTzDrgb
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2019 19:42:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="D7pMMnHd"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FGdh5DhpzDrfv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2019 19:42:14 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id l14so8290533lje.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2019 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9mRsUodr8INx8kLiQuFLT6wntAGfHnLDVBZoZICFTI=;
 b=D7pMMnHdfqhTHEbILraVb+LJvXqHH0oAURqSthG109P6NhNjxj8dD1tTBKCsoZE6Wg
 +ZVyTADxuYmkbpWAU9YFNL+rpYNJAnnwAf1p4HUn77wkRPYNFoWUreoo8oq8nyQy+da8
 Y4EaWT/NZVIPTHhT/82Y8zlr/QsGAQEGJRBB/8CGdQOZKAilJteJ6NRHVCfWJ0EfLQkw
 ADRGbxPFwc43sXCSwFxqXc2rliWafXYyjNHb6g3A31lCi37BDlIFfaYbwMXOlolMDvVK
 5IW1yX/qn1VkdCUaFjnINEp+cGHSctJDS1HErbvHADRBx7bEijJbDa9sf0CIZlN889Vp
 +S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9mRsUodr8INx8kLiQuFLT6wntAGfHnLDVBZoZICFTI=;
 b=TN51fH1H6jGiJztDQpbHL77n8lcQ/gxTACFKdtp59g1Um1g2pcrZoA36GeMHwwPSjw
 lbDTP/vhuGWyEOBvjXQT4Nduwb7UOPNsyzl84LZhUE+yspu0tfOBs7O+Pz0YiqW30gdz
 ublwICW03fO5jineDJFlM71wmXjdWcb0k0AUv6nj5ZLSuoCr1VvJahZ+s5kiG6X7xSe+
 nL4Qwyf9zM7IG8lRCGDAatA5vVePAl/tdrolVTCkMHFw7HGjKPZbubt9qlilxqgKUCCR
 7S+rD87T7w70EWAq97MfADOCQxIEw8tvS1gvxHD66kUuGC/+ROHiXspRSYt8S2MjrwD+
 gjtQ==
X-Gm-Message-State: APjAAAWnEWeQdTV+JU7sRC23qN3aVsx+o/rQc3L25/xXKt/taEnqBq5+
 zWlgGOVoHUzCqJHZ9KYg4lv5CWJZYAm52IoFrjhK5w==
X-Google-Smtp-Source: APXvYqxbUW9mwdFAw8PYUVklPhImRXOOG2mrpV80i8O7nFOQr4/Kq5cY8eZfZBLO11XOblNgr1rWKltULlseXo8MMs4=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr2368029ljc.28.1566553330329; 
 Fri, 23 Aug 2019 02:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <1566335128-31498-1-git-send-email-hongweiz@ami.com>
 <1566335128-31498-2-git-send-email-hongweiz@ami.com>
In-Reply-To: <1566335128-31498-2-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2019 11:41:58 +0200
Message-ID: <CACRpkdaa3tWw_LC6Ce9Ru4gFji_SquitmsDqThRj114=Fro2zg@mail.gmail.com>
Subject: Re: [v8 1/1] gpio: aspeed: Add SGPIO driver
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 11:05 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> Reviewed-by:   Andrew Jeffery <andrew@aj.id.au>

This v8 patch applied for v5.4, thanks!

Yours,
Linus Walleij
