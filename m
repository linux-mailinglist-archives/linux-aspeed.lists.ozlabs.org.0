Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D933BC2
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2019 01:08:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HrLs5TZDzDqT4
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2019 09:08:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="WnjU0E/r"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HrLm3VSCzDqJs
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jun 2019 09:07:57 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id h11so17879851ljb.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Jun 2019 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NFfbp/l7iiiVWginEhWa3ckd/womtHkaNdf8Bm+794=;
 b=WnjU0E/rAfa9vZPRfObu2NgpsAHWsZFHvUV69mxl3ei5E4u3wUqLrcOWCZxid+etwI
 idPmXKgOnv9LyIDizXMxnkZQ+rv8mvDL6cTXNKkn9o9jIgCoa8xNvnMpVupFnH/DBubR
 z7Bbbdf/rBN4ueBDUCIbsmCasr1uaK8BDfV164NMFB9nXdq4W5H6ci7QmylT47TohsdZ
 UhPArasjBBa8E/NXknmNzB6UoToQJo50DzNz5SA86P600icvEf8/0jXCnibqqjJHvO8X
 B8hbGJOYCQTjKJyEJew5yq44nQGuynbzdgtPWt1JdD7FsKL6iZSbeNyy+BXMW8o2lh3H
 3xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NFfbp/l7iiiVWginEhWa3ckd/womtHkaNdf8Bm+794=;
 b=ruAXEPOizbTif+X3DLWNjHoZGwKJ5+2mgCvV2I6eGWzExHJkNFFQiiIY6qLTRw9YyQ
 gpkUcEWQYVrKkuLlmQxDtDr4/SSxqU7s6KRuesrvAcRxnV2Zv4UIpJnRpcIQ+Pb4FBbR
 QOsJ0TM96OfJ77wMS5QzR7uZMKWQa/uWs/c1P7lkhLGrZtDqoJwT29k6xCGRyLWPuKHE
 /2I2zFKXf7Yj4te6fQ814yFkKvRbMuWQHahGbqVbAxC2T32osZYra2qPfFCzDl7u8GVL
 2h4Syix4cGLIcOWoVr1vTYMJtfF5wN7b6qQZfqULvil0M1fDMk5vvWV6jzBfsXIdyzxq
 S0Zg==
X-Gm-Message-State: APjAAAVtRvsYWHPwHgoe0ylIvBsJrU0wRHLRFVvdaDjNbLB0Oyce6YxC
 0qq3hs+kKWyYBjP8u6W9/blQqFvyaNvR9SFMKrrHwQ==
X-Google-Smtp-Source: APXvYqx/DD8LnqDfO9YJiKsu3INvZtWWGhNNb2rLcK1MCFxZlVhpM9tSmP7auz1Iw4f1nXvHBAfBzZXk3RUmWeEQt6U=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr8048502ljg.165.1559603272528; 
 Mon, 03 Jun 2019 16:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Jun 2019 01:07:41 +0200
Message-ID: <CACRpkdYPHw994Ov0xCfK6tCg60tiuWrRwTcYpMSfOr4G0VKu_Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1 v1] ARM: dts: aspeed: Add SGPM pinmux
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Hongwei,

On Tue, Jun 4, 2019 at 12:44 AM Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 2 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                             | 5 +++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 4 ++++

Please try to separate out the change to arch/arm/boot/dts/aspeed-g5.dtsi
into a separate patch that goes through ARM SoC.

Other than that it looks fine to me.

Yours,
Linus Walleij
