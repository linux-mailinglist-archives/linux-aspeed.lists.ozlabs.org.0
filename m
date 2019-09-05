Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4383A9CA3
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 10:11:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PD0r3SWFzDqtG
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 18:11:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FsniQefV"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PD0b0FzzzDqtG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 18:11:10 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id w10so980335pgj.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNUhBxF1OnG3d3ID43Jl2Sra4Jf1K5JNUVXSe0J/Mmo=;
 b=FsniQefV8YjuNc/PRrZO7rOT/9G0ax8+aLc2Sz/tUwIKjH+DrNsgTNPIdCNssllbf1
 yTsw2jCCl+nhi3JG+3OiKUJbn9m3OqZzU/MwtpGG7EvVTeby+PTM1a4kWl+pAl/W8p2f
 QW3A2gnfv/hpd5csElAMUYftBSWWIMgYAbyA8tas18mDueWBGlE+8y8yMlS7K97UJz1e
 FdGd63Y59wGv26usW5cD/I64bNqERDONTXMRb/TQ1dMOR3neAW0ou+hw7gmHuZ/jLN3R
 Yq6qr2hqq64hFguW6qK+LgttRPvNo0jBVjB5hpdOXr7pVzj2BUERpVvhbtWwaa3rb9Bu
 0X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNUhBxF1OnG3d3ID43Jl2Sra4Jf1K5JNUVXSe0J/Mmo=;
 b=sgXm2kthvWmoN2hefNd/bvOeuqCXbk+1k/Iyglo+JPiTiZjdRfo7OTVT/0/EObIRPS
 sKGIINDvsTi3gVyAJYUyUBK2ube8jT3u0CD3dOs+mKPQ7nmafY9W7zMtkt1YuJsHoSxK
 JhE+zSh/bklQAxwLSroVW8T2dP6brTCQ8aM48k4d0y5gQ6ajC0ouK3HSekQqGTmQ1vxi
 xCAQv5Ql7sjOhtANHPKl/L4mFx0DwcoajSBnau4bWEJunON9oT2Ato9ZWRzOxDHKlQic
 rJppM/Sdir29IutAWz6Asp6xC3IY6NsiFXfE6OqIN3yYlFTaHEfrg1JZNLiICX6aeYCQ
 pDLw==
X-Gm-Message-State: APjAAAUtPlh51c1s4bbrNEzhCsNhq0nz9nrkkxJlLiSEzziZyMDBxGtE
 TGjNNv2ULEJTPb2Rz7y+iUnBf0YeKeIkan/H0mw=
X-Google-Smtp-Source: APXvYqxtpDJ3+oWsCUzA9PrngplgA8XurQG2hkrTxbU64Fwo0RP5J+VAvVKFqCivcEjjcIw5AUIW1TNKX62bq9nBXEs=
X-Received: by 2002:a17:90a:338b:: with SMTP id
 n11mr2570783pjb.132.1567671067543; 
 Thu, 05 Sep 2019 01:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <20190904061245.30770-3-rashmica.g@gmail.com>
 <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
 <1ca6ffddd2452e218ef19ea84ac6c6277e1a9725.camel@gmail.com>
In-Reply-To: <1ca6ffddd2452e218ef19ea84ac6c6277e1a9725.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Sep 2019 11:10:55 +0300
Message-ID: <CAHp75VcCUuCNx35DReO4YzSgDv0YJPKXdpL+xNyjwOZX8jvVtA@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
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
Cc: linux-aspeed@lists.ozlabs.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 5, 2019 at 2:34 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:>
> On Wed, 2019-09-04 at 19:30 +0300, Andy Shevchenko wrote:

> Perhaps this and your other comments below would be best addressed in
> an additional cleanup patch? This patch follows the formatting of the
> existing code and it's not very clean to differ from that or to change
> the formatting of the current code in this patch.

OK.

-- 
With Best Regards,
Andy Shevchenko
