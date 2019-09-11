Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE087AF9EB
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 12:07:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SyHW2SptzDrHF
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 20:07:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="b5WLEtD0"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyFB4kz7zDsTG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 20:05:02 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id u3so833324lfl.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEBAvzyvKwKy4+z0icRgfRVKXYXcNb1iM7EN7yrDUow=;
 b=b5WLEtD03nLPtyVSE+wLZn9h7qijVtAN+cYaeN6IYy+aFGDtEbDuL/gYsMMM/a/5ed
 Bm/8bSgVFY582J67Cdazp0Jc7/0Ip0JtCwnp1Jwa0sBRHurYKd3AFT/MOoX9EgKmv7Wt
 THm606K5uucv2RO6R7HvnwPXo9zNI5/SCpU50YcpK5nYOIZ/jeKlZyT4JwA91pyBCRGY
 76K3WnTq/FQ1cFtQhenLCpIb3UROTl/67IWPqHB+hXeomfMlanRc/zaQHe3r5hBODnQq
 lVYiLeCNz+Ewk8X+yoLY0VvEITQNeFzHI7YN8tMAZaUuIjZtJqEzFplZ9DoSsXHDz63B
 er6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEBAvzyvKwKy4+z0icRgfRVKXYXcNb1iM7EN7yrDUow=;
 b=UfKm0IKaopcHUrPhAnCKyRsH6oWAaE7WtBqpkeamAAwvMkmBpDgbPlldM5408enSx4
 KlRy+kr450AUlyv5twj5IW2qTMHIrbtTJrhhTI0ffLGa4D1nYP6t31oPw8vAFRaCzQT6
 w/t0vlVPj8nPshWXd2QSuxttgQbmebjIfRF4utbJft61W7ZJBfcVogwas95BppZuubkt
 kMf4KdlvQcMz8GHxaPWA1GZqXtQ3KONDyzC10fRD/cgOzIF39e6i5FBVzGIypRTLEiGM
 SGjXqdNGJd0G1EUcBTi0Dg1+U7wEQg8YTYrh5h1Hn6bYGozydwiiTiWVFZle87ZrK2Gd
 TIDA==
X-Gm-Message-State: APjAAAWn0l5blR1DVRjJ4cD4Voug+GoWs5QA0n1vPH1GvtdI8VUltDev
 bSfQ7dYIfx8ozmAsOlKtQSh8xSvQm9KaYWCfG23lRA==
X-Google-Smtp-Source: APXvYqyC+pv5N0Vcj+RE52xkcBxAzDFKvxknvjpMo7X5lxTEnajzZlDFTx5W6vtzY7meOzprM4Zolus/zI1aT2yhpaQ=
X-Received: by 2002:a19:117:: with SMTP id 23mr23845320lfb.115.1568196299188; 
 Wed, 11 Sep 2019 03:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062623.13354-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062623.13354-1-rashmica.g@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 11:04:47 +0100
Message-ID: <CACRpkdZvBHk65Vs93YbrTR92-8o0SgtUUWMBXeABQH0PZwpRxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio/aspeed: Fix incorrect number of banks
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 6, 2019 at 7:26 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The current calculation for the number of GPIO banks is only correct if
> the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
> currently say there are 0 banks, which is incorrect).
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
