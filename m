Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB78F45B7
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 12:30:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478dNj4bjdzF6cB
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 22:30:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="iGMI9aiS"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478dNQ71vzzF6ZW
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Nov 2019 22:29:58 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id g50so6089251qtb.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Nov 2019 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=19tliVy/iIF1NdAW0nZ7cVhCkJOFQ8X7U9RXNc+1Lro=;
 b=iGMI9aiSpFkL2Xcx4lkbR0yhLSgF8bW9F0DM80XakAiuf87a3LhSrmEqWIMzZyTbqA
 fkvDVTPzY9blj61tPjO+wW0caVDkIA2zMoLqO3dO7V8u9M9KGCAKoglxHxAar5UVcmEo
 hxXdCIR+AvMno0NkoNHKMLQCXxI9cNeaSFE7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=19tliVy/iIF1NdAW0nZ7cVhCkJOFQ8X7U9RXNc+1Lro=;
 b=kcsBYA76DlUI42RXOe3reHbt1bySgvjFLrWtynilYf0rizrOwGcXup18qDHAdsw2bO
 YSWiu63LxCbArIrvrhe65h4OgHmt8hWpCFR2o0qRVMsYXCJYMO+AySRUSLku29/7DSCi
 S54hebadb9O/dw/s3aWr86cY32F2FsTq9f+ihGSXvaE2gjkYDfxCodiU7bO3Qx5wMrr+
 oDsnnnTvjg2Bw35OLlePqISBk03JKDDqOQJnuPE2ZkttJDyaTbcettG5/kmoeFDumiGs
 4vKWjR8PpTs5tQfVb1lfXOsRpf24tf19ZxMy5RXoCeop09IX5j6XyLd1aEm83nZ9yEWb
 WVRw==
X-Gm-Message-State: APjAAAXE/ZQXaZrYkxjpq1m5RUyMnMMQyeXoWnaCWTBfWJiAvtB01n8Y
 k3h9i+ORr5D0zyOQS1DYgW5IN/Knvm8S10k6+Yc=
X-Google-Smtp-Source: APXvYqwKJZ6bO/qaUDabsFFu/MQ2R2cYOCy4YbyBPX5qBunktYtwdlI59RKnWWOSZiCLoSbjjip5Dos01Fg2X3vQ3QI=
X-Received: by 2002:aed:3baf:: with SMTP id r44mr9788084qte.255.1573212592983; 
 Fri, 08 Nov 2019 03:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-2-andrew@aj.id.au>
 <CACPK8XcGgGsoLNpCccKPb-5bojQS4c5BePewwocc-z29On7Rjg@mail.gmail.com>
 <20191107230029.75ED72178F@mail.kernel.org>
In-Reply-To: <20191107230029.75ED72178F@mail.kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Nov 2019 11:29:41 +0000
Message-ID: <CACPK8Xe7dmeVjQYObzOw9LdwxH3+1XTcU+RJOZo5C69j8d-yOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
To: Stephen Boyd <sboyd@kernel.org>
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
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 7 Nov 2019 at 23:00, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Joel Stanley (2019-10-31 21:50:42)
> > Hi clock maintainers,
> >
> > On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The AST2600 has an explicit gate for the RMII RCLK for each of the four
> > > MACs.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > I needed this patch and the aspeed-clock.h one for the aspeed dts
> > tree, so I've put them in a branch called "aspeed-clk-for-v5.5" and
> > merged that into the aspeed tree. Could you merge that into the clock
> > tree when you get to merging these ones?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git/log/?h=aspeed-clk-for-v5.5
> >
>
> Can you send a pull request please?

Sure. Here you go. Let me know if you need it in a separate email.

The following changes since commit d8d9ad83a497f78edd4016df0919a49628dcafbc:

  dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
(2019-11-01 15:01:18 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.5-clk

for you to fetch changes up to d8d9ad83a497f78edd4016df0919a49628dcafbc:

  dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
(2019-11-01 15:01:18 +1030)

----------------------------------------------------------------
ASPEED clock device tree bindings for 5.5

----------------------------------------------------------------
>
