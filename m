Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD4A7368
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:15:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGqS5jbyzDqq8
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:15:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e44; helo=mail-vs1-xe44.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="S1KWANYd"; 
 dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hqy63PZJzDqY5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 23:50:21 +1000 (AEST)
Received: by mail-vs1-xe44.google.com with SMTP id j25so13451996vsq.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Azqn8B8zEoK6qeo0gqFEO5Y6U0l3RHxOtMnA5UrW9xo=;
 b=S1KWANYd3hxj20Oktt/812hJNXbDjSq+iPYkPPc2E0UYVq1fPky1u8+0m7jBg5Qjsu
 9saaDiWsSk4C8ciJjV6vtKC78MxSVKTNzdP982jnw2N/G8BpDzqPlr8nffUPXrF0A1pK
 ptEiM0eRGUZHJCu9UxuZkDRv75hDXvbeqpB7J7f6Bu8mWSP1mf5PW6de3EGQH6LDOdLU
 NuaDp6E1e5rMaQpoxVA6l/lPkC2bnH8xfK6WpgUUcG0Oo3jjCr0WIfP26jhk+RgHKM4C
 r+Eq5tnea8njJrkwp+1DEfxMt7F0Vuf4R0p7KVhTzeoTFopw9bSjA0Rk0eSiGj5Gk+7U
 hhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Azqn8B8zEoK6qeo0gqFEO5Y6U0l3RHxOtMnA5UrW9xo=;
 b=rQua4Y/LoDtj82F0fkjjBS1lsK6sO1XshkMJKnrO6fU0sEe6aWD15GoKzdlyXp7t16
 ieYWGVTnNsgc3K70dVs/w47aV30fHEpNIxGgcblmTDPE+P/EcMw1d/IwkDJcJqRw4nvJ
 +U1jXElWrq/IF8wIschGSrwqbUIWH8VfVDl64vdVu0wKwug7kaW+aIkOq1bHjz/RmH01
 kpg6KUY8wZdGYQsdO2HeHlz+F0c5WKHowNSGWa7Zu3quBa4verkoXdqA0Xp8LbnEAvtw
 uTm2gvlfFZVq1iEcOHjqwAv+Rvlz2JyG/0DHfry7M8ntSHByyacW6OObu127Eud2lwUN
 XdKA==
X-Gm-Message-State: APjAAAVtuZppXswakB76Wk5XSkgmdA5/S7OyOBcsWjeMHhZuJnHh4Hqg
 kJOO/EuZuS7rsy9oDPW/Vqmxt2sTIYVLioPJLOGRaA==
X-Google-Smtp-Source: APXvYqx1yncYH92Ikl/BgP+ETxGhkpBu01ffZ2ej/nlflY0sLbDKUCylNmbGeeDyd6Kvh74U3dWYaZ9FdZniZqF64rY=
X-Received: by 2002:a67:e287:: with SMTP id g7mr13476377vsf.200.1566913819149; 
 Tue, 27 Aug 2019 06:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
 <20190826130343.GA23584@kadam>
 <629128e7-cc91-412f-8946-668fac2eb3b9@www.fastmail.com>
 <alpine.DEB.2.21.1908270845410.2537@hadrien>
In-Reply-To: <alpine.DEB.2.21.1908270845410.2537@hadrien>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Aug 2019 15:49:43 +0200
Message-ID: <CAPDyKFqXLG7VCh+9oQQ4HD=6dHQLY1PHEkmC+atnB-zDntKULA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: aspeed: Fix return value check in
 aspeed_sdc_probe()
To: Julia Lawall <julia.lawall@lip6.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Wei Yongjun <weiyongjun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:11 +1000
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 27 Aug 2019 at 02:47, Julia Lawall <julia.lawall@lip6.fr> wrote:
>
>
>
> On Tue, 27 Aug 2019, Andrew Jeffery wrote:
>
> >
> >
> > On Mon, 26 Aug 2019, at 22:34, Dan Carpenter wrote:
> > > > Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
> > >                         ^^^^
> > > When we're adding new files, could we use the prefix for the new driver
> > > instead of just the subsystem?  "mmc: aspeed: Add new driver"?
> > > Otherwise it's tricky to know what people want for the driver.
> >
> > I don't have any issue with the request, but I don't understand this last
> > bit. What do you mean by "it's tricky to know what people want for the
> > driver"?
>
> There is no obvious algorithm that tells how to go from a file name to an
> appropriate subject line prefix.

For MMC we normally use the name of the host driver file (excluding
".c") as part of the prefix.

For this case that means I amended the header into: mmc:
sdhci-of-aspeed: Fix return value check in aspeed_sdc_probe() and
applied it for next.

I also took the liberty to change this for the other related patches
for the "aspeed" driver to follow the same pattern.

Kind regards
Uffe
