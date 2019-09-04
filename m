Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87629A96FC
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 01:19:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0Bt2X0SzDr0k
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 09:19:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AKGsaHbL"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P09H14NCzDr0X
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 09:17:54 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id x15so270334pgg.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=9R72raBBWXijV+vBxS2q3Hmwuxv9Ffre6Ti1aTb9Nhs=;
 b=AKGsaHbLbruRWWZut5eEkFINbN1RAtp5Gc5P4ly1St6QoLFKbCCPMk1sCW6yIOJmU8
 tgKoh4yl45sNzYiOglayAY5CL082kzY1Wz8BajqyKCYe1j0o1iBp/BhUdx4PkdtJovlo
 gddskujNDf7UReyFhrKEXjpli2ejZeidxVi5sNsASu+MTUwt9s+GokTa7o04VKCCSNdO
 iSW3KLaJcTPQwfTyiUfH3u2uJFmwy2eDCGEbwP3ASCSTqzfC6REQqGAEyEVeGHMcL673
 sknyKtVLzla3A9W1v0ng4vS31x4w609YoumtFD6i0+aCcpwFyboKpck83kPrsJKNAGOV
 mJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=9R72raBBWXijV+vBxS2q3Hmwuxv9Ffre6Ti1aTb9Nhs=;
 b=BlSzztHmDAVLtaegvDjTKDEnTlbOOIpz7Qpyr4AITTH+CCZuFhTnJkK3I+DAJfSPMS
 yDD4GB3D9DLRlPX3Dzs6fTB4VorrEoPezFmfe6ScGnq+VFbV59XqZ0suKekPJPXfvi8N
 iJxOITowf19Fy441nfymeS9qqbC/SdGl7Ik2O31UcZgLe9Ka/CIJAkzoOX3mnedT4evC
 aTfKYXlT0M9yD+pE1nJIE0p6Hn5dSYMSSIlDKV4iOMBRQZNi1or/Jg3aglsmJ+ugEaZX
 a6nSRhW3pnFjzySbNpAky2BRNvTelL6ZNogI3179OEeBFRtSqoupgQWWavC4tUmReXYL
 APvg==
X-Gm-Message-State: APjAAAUTlspTjw+zRzyLFLUtBs0UxvmQHqlgkTawEMX3gLGFrQ7hqCQd
 QssvpcmA1Nob0vYuSfckPQE=
X-Google-Smtp-Source: APXvYqxL8pWcjEkEVw7JhxurqlWcxCeyoZCsxf01cpuezRH1sJw82JW4DIXFjVgtu+WiHE3w/hwa3A==
X-Received: by 2002:a62:168e:: with SMTP id 136mr232320pfw.144.1567639069538; 
 Wed, 04 Sep 2019 16:17:49 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id r1sm177579pgv.70.2019.09.04.16.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 16:17:48 -0700 (PDT)
Message-ID: <dd62da5f10c06fae1823bf8338c2acc83fe40a40.camel@gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 05 Sep 2019 09:17:43 +1000
In-Reply-To: <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2019-09-04 at 19:27 +0300, Andy Shevchenko wrote:
> On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com>
> wrote:
> > Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
> > 
> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> >         /* Allocate a cache of the output registers */
> > -       banks = gpio->config->nr_gpios >> 5;
> > +       banks = (gpio->config->nr_gpios >> 5) + 1;
> 
> Shouldn't be rather DIV_ROUND_UP(nr_gpios, sizeof(u32)) ?

I agree that DIV_ROUND_UP is the right thing to use here, but wouldn't
it be DIV_ROUND_UP(nr_gpios, 32)?

> 
> >         gpio->dcache = devm_kcalloc(&pdev->dev,
> >                                     banks, sizeof(u32),
> > GFP_KERNEL);
> 
> 

