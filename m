Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A832CC8C9
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 22:20:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmX1S2nf2zDr74
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 08:20:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BqzZHtMD; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmX1K4BzjzDr74
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Dec 2020 08:20:05 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id 7so2207144qtp.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Dec 2020 13:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=99Y7wB6PwhBW9HGShktQMrV6OKqAm5XRMWuYeiHOpak=;
 b=BqzZHtMDKJpRPAQBquh46oC1vWNiD4dwoerDNazlU1w0YLUyXjUsoAlSewXGHZ4DPr
 BPdkF0+l0vZHy3gZ3qTZg70oaSFUrLBUvj8qHjQKIWi178mTmlAkXt/HD1mo+/SlAjeC
 7LhN+sBo6jS5Vlg0Lj149TfVnBXPwx402/q/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=99Y7wB6PwhBW9HGShktQMrV6OKqAm5XRMWuYeiHOpak=;
 b=D4uu3ZoBmNNL6YXx0YhsEoKL988g4Ox6g+kI73vp6lX8xHex1JQ8UpaY3nJ4dMKclX
 hg3rI/s7hr0/c+XVRBfhTUg3Hu2l93/UPMm4uS8tdvYQzSpzVZ01MhNMp//J2/fKL8IR
 hnl56nj+hkq8WQ8vkGB1JsrWDWjN2AD6fy6ulja4pjtJ5iGIict+EWsQ9Q2bPk5t0SAC
 lGNNrITmaH79edKOvbU8nzKzO2uyLp3aomQvSNGoF2frVdwZbjWPq7V+6vNhgRKtxI8J
 bxV2CM4lNZEaBF4tpTPU1nyLqY6pJ3GZqZR8sAzLc0gAMbib7samLiWqHLcMYrLdNMOg
 UN1g==
X-Gm-Message-State: AOAM530ctlR2bQcmp4iz2sELjmXqZx1xALwMpl8b77nwOq1BTXmP/xU4
 D1qBUqPLwsGHIdECs8gGCqjiTk3tz1Mx+LZ7AuM=
X-Google-Smtp-Source: ABdhPJxIBl1u25BODd0tJolB1/liAW5YH4mGsYbeA+xrKq+OgjhUxHxZBjU+lV+Jfj2+NJdO5pwPenyT7U5LiMfTUPU=
X-Received: by 2002:aed:2f64:: with SMTP id l91mr63647qtd.363.1606944000942;
 Wed, 02 Dec 2020 13:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20201103072202.24705-1-chin-ting_kuo@aspeedtech.com>
 <160683107674.35139.14509237313835347013.b4-ty@kernel.org>
In-Reply-To: <160683107674.35139.14509237313835347013.b4-ty@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Dec 2020 21:19:47 +0000
Message-ID: <CACPK8Xe4TcRVBnZL7vtqGq1PTe5NEx1k4hvk4FDeYgJQ9HALFg@mail.gmail.com>
Subject: Re: [v2 0/4] Porting ASPEED FMC/SPI memory controller driver
To: Mark Brown <broonie@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 1 Dec 2020 at 13:58, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 3 Nov 2020 15:21:58 +0800, Chin-Ting Kuo wrote:
> > This patch series aims to porting ASPEED FMC/SPI memory controller
> > driver with spi-mem interface. Adjust device tree setting of SPI NOR
> > flash in order to fit real AST2600 EVB and new SPI memory controller
> > driver. Also, this patch has been verified on AST2600-A1 EVB.
> >
> > v2: Fix sparse warnings reported by kernel test robot <lkp@intel.com>.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Really? Or is there a bug in one of your scripts :)

Cheers,

Joel

>
> Thanks!
>
> [1/2] dt-bindings: spi: Add binding file for ASPEED FMC/SPI memory controller
>       (no commit info)
> [2/2] spi: aspeed: Add ASPEED FMC/SPI memory controller driver
>       (no commit info)
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
