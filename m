Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8021AD3F
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 05:04:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2yZ00zKqzDrDp
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 13:04:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z0lNoGhG; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2yYt214dzDrDp
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 13:04:18 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id e22so3437485edq.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jul 2020 20:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLfw68r/hxoh0NgCLBxSxGfsf8FdyOcJYnFgZuru9c8=;
 b=Z0lNoGhGxomlXESnJmJIj3kaLlNfCpfGBY6uILkYPuZZ9qub3uS3pGM34slmHTbaLj
 +0gus1ZS50pj/Rg3hgjpyR5wff9NX1Ufq6Uu8ucnJW3va9mS5yhDd4NyuQZPyzZSAKhH
 PneheiBTt10S8gJdhP0qMjFUgIW6DvjkkgEVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLfw68r/hxoh0NgCLBxSxGfsf8FdyOcJYnFgZuru9c8=;
 b=MjjGFEQI1kzKO6LqIrqDBg3vAmvq+i1yBJ21XlPy2XNxLjk9ClesrE4WaTeudMlxyl
 a8+YBaBegaSYLnSkUisD4m4LIwQ3aWuTl8KpBxWRnueQf3k0xW+40DKgvkeQNblD+/n6
 f62iNykeawB7h/LxYKJdxPmjqeaKEIg1mLKo8+MQI85Jz451RuXhxLukVDpgC2tGGFl9
 y6xjhq+H6Zp9okDC/88MimQkaixGbLUoog9D/M29F/BwupzoRHL8Uxgw5rtokz2vX5bD
 Kq93PSCvn1RzBmn5buUzzuyZHGYa1VoxZIAh6QHpgHuwqAziumOz1IhGputjYgmD40f2
 sr5w==
X-Gm-Message-State: AOAM530cv3s5BQ084VacZdBre3oCkACzr5G6ATWdGZEKIUq6h2zXd/Ue
 CQB5uUpByR6iQ/CzV0IBzQamtvRWsiK7gmYauu8=
X-Google-Smtp-Source: ABdhPJzpdveYcIc6pgM/Fe1jdllnZf80Q1VMKGv/QELC2YPCTMnO/7YKXw2PDoRwqL2q3b7XfvqI/pFBrn+kpAQhutY=
X-Received: by 2002:a05:6402:202e:: with SMTP id
 ay14mr75165877edb.233.1594350254944; 
 Thu, 09 Jul 2020 20:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-3-eajames@linux.ibm.com>
 <4acad452-33c7-4fb2-ba90-19a824558b94@www.fastmail.com>
In-Reply-To: <4acad452-33c7-4fb2-ba90-19a824558b94@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jul 2020 03:04:03 +0000
Message-ID: <CACPK8XcWEn-M291U1va7T=5R0qHp3D0hy53-fkEw7pa_iQu6tA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Fix clock divider calculation
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jul 2020 at 01:14, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 10 Jul 2020, at 05:27, Eddie James wrote:
> > When calculating the clock divider, start dividing at 2 instead of 1.
> > The divider is divided by two at the end of the calculation, so starting
> > at 1 may result in a divider of 0, which shouldn't happen.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")

Stephen, I think this should go to stable too along with 1/2.

Cheers,

Joel
