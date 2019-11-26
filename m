Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D553E109768
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 01:59:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MQXx1d2mzDqfd
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 11:59:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="DIUUFeWU"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MQXl6zthzDqdk
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Nov 2019 11:59:35 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id p14so14646589qkm.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Nov 2019 16:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7XFzCWonYVHxuwP5fu1PxHNZ55RMRiDHqimUZntDh4=;
 b=DIUUFeWUjfSEHzwzxtnqA+xNH2Id50fnNM/fiBRukFlSKzmoT5qSKQJFnv4GuHOpq6
 71gU4R+PrKIedYDMQNEvHspR/u/S/UeN7YoHLzEi3ZRGmbuqRDp0szLHgOxQ2c+DuMdS
 BmuAqg6Z2B73TF+Td/X7g38Qz0Klg/3Muk4Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7XFzCWonYVHxuwP5fu1PxHNZ55RMRiDHqimUZntDh4=;
 b=Xor+gUpWJ/gPrts50XgGx2jL4BxJl+Bhq2wrrI/qmYy0aBfn3JwpfsR90n88dLBn2I
 Gc2Wx+1i7yyT3W8IhLaINoP6lZMr+pPP9axCoJMefkBGTO2hGpUfpSdaiUApnyvREDRj
 yKa0vyumqngTCbhqsJy1ZVsnLMC518YafTbHWcTLrvS7xUvAcMfRa8uvuQg3aX9PH8m8
 UC9YxG43/5SLX8ox4QnjYYxSmkvHZK9ZiGRaMVvzhHaJ1PGUpO4chDcz+iSQlMRXk1P5
 6HhjNkzCuZUP/jN4OGKYuBf7LV7U5UqwsFeTW1gXskvAou6b2RUNGCRj+aoC8jd+F1Qg
 S/WA==
X-Gm-Message-State: APjAAAVtCa8DNWGkT8e8G26TuWkQj6un1K8BG8yMsATfDT6tuKlClGSH
 m0Z/U2cYyG4nFDzK4FZjIsrMcjwXn+RyDZ13Ih4=
X-Google-Smtp-Source: APXvYqzxouakbsyDuepwnrAYMPQWMY5b7/QqbsrmtOXq9S445ZLuU58+ueka4h/ftWC1n2cYQWh+IaXs6/v0/YH2Je4=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr13396683qkm.414.1574729971439; 
 Mon, 25 Nov 2019 16:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20191010020655.3776-1-andrew@aj.id.au>
 <20191010020655.3776-3-andrew@aj.id.au>
 <CACPK8Xcrc_2itUcGw6caa8Fp3sJE8oHBO5LJgBtqScwmVAuHJw@mail.gmail.com>
In-Reply-To: <CACPK8Xcrc_2itUcGw6caa8Fp3sJE8oHBO5LJgBtqScwmVAuHJw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Nov 2019 00:59:19 +0000
Message-ID: <CACPK8XchwGdgE95jkdhwWbp0r+NHge7W3q6yQp-wzfxV3Kpajg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add RMII RCLK gates for both AST2500
 MACs
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Thu, 10 Oct 2019 at 23:41, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > RCLK is a fixed 50MHz clock derived from HPLL that is described by a
> > single gate for each MAC.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I noticed this one hasn't been applied to clk-next.

Cheers,

Joel
