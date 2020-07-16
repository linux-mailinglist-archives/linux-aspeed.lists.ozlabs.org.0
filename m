Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F0221E70
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jul 2020 10:32:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6nZC0tbdzDqX7
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jul 2020 18:32:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a8eMFsFU; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6nZ26mhxzDqHd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jul 2020 18:32:42 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id z24so6158247ljn.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jul 2020 01:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNLNfVPPAHXyv+eb8ftyyjegAwGWrhOLC//iWWVh0IU=;
 b=a8eMFsFUt5xNqeJpZ3u2ZRxxpxDwrwFJVD0nDwMFeJ15CvJdGCmCpcAsEd5yY57HJw
 7F9jOmQE4A8ktqHSk6mk6o5iHDxqXwAZenN3sXTjvCYACKU4VLls6zvfWBijK6+kq/sT
 tdA/GkXqAP3rMNLJAXISr1n/GwwfEx6RwTHBtLA0Ad47OlnvEB92xYwf+n6HbhhIynQ8
 nWvwhUsgNk0gW3PNpaPHpiwsMnJhdFrvYpR5VayiO3JCzN5I3JQ1xLmpD8eLUszf/ged
 AVdu4lh2dQOJyyvLUk7bonTsV0Id/v7h+05lFMqtmJu/I+F6cpIPemAqOVhSodAwOcem
 cjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNLNfVPPAHXyv+eb8ftyyjegAwGWrhOLC//iWWVh0IU=;
 b=leXuTpgPbpWUAn6OjjOYQ0UYffPTPcXDCrx5i3AVEuhZ1Q8KSo3CUUlR6dAxa76FJP
 YLgWHjWDA1ZDvP5DWK0mhUmND4iQmss49+qM8Z7HKqtiibOZTodb790gBkIKp50uO93g
 qYycC2iUSf59v9nB6b6r+KIP0+LsgCS3G82VlMJalLXWKegRkzyyvFJlxv2rcdqJdx1v
 vFmo40tRmG/0M9X07E2I18xSCoWxoY7wl46zHlwdANwM/SZTsyO0nLczeDO7UnlL14ZN
 +Xn9hGG93Hwz86xRToMzqhHbDB53M4DuXL5EpZvquZzy+k9dXGVRpznR+gx1FSzrPVIe
 6Ldw==
X-Gm-Message-State: AOAM532uS1Z6n+pf7Kmk8oOjBYbaeUlJUKeZuruzuBYoK7wnBm51TYYj
 FJ8o6aQDJWoYtUMFBmzCSW3WLGe6v6+ELMut5bOvzw==
X-Google-Smtp-Source: ABdhPJzgi2w25laszd9DgCZI4r2GaJsH2ivcxS3M0FLKQIG/i0s/VnFMZFUEdmKrZyboxEE1oxCCYQzJJx327kyUqjI=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr1530220ljj.283.1594888359139; 
 Thu, 16 Jul 2020 01:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200701030756.2834657-1-joel@jms.id.au>
In-Reply-To: <20200701030756.2834657-1-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jul 2020 10:32:28 +0200
Message-ID: <CACRpkdbeFP_8R6Q1n7S7g+BS58P7bKx8EhLu73g6PsqfKCjcew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Describe the heartbeat function on ball
 Y23
To: Joel Stanley <joel@jms.id.au>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 1, 2020 at 5:08 AM Joel Stanley <joel@jms.id.au> wrote:

> From: Andrew Jeffery <andrew@aj.id.au>
>
> The default pinmux configuration for Y23 is to route a heartbeat to
> drive a LED. Previous revisions of the AST2600 datasheet did not include
> a description of this function.
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied, thanks!

Yours,
Linus Walleij
