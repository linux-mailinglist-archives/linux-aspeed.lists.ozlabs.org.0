Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D78891573B
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 21:34:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lp8/TvQV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7J7g1DKPz3cfn
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 05:34:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lp8/TvQV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7J7Z4Lt5z3cYB
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:34:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A746760F80;
	Mon, 24 Jun 2024 19:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3A2C2BBFC;
	Mon, 24 Jun 2024 19:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719257672;
	bh=BoW+izWMrB0vUIgdczTG8eY31gFwP4//AAgzMGmL2dM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lp8/TvQVYFswu33lkx0ks1qmHin9SfvJe1OJt6aVDfBxiJNuzBjVuZFPAocNe2Kp2
	 xl6aghAFbuwFuQKmECp3Xmai3FPZLHnTJHzss/36QxfOkIFf55zJXtabwaKanPOPh/
	 Uz47iksDtHlIskOzDB2umFQ/EGOHLyGKqDeKufzeVhxAnsNz3fV/i3r/6VIyyxm1t0
	 eVpNTmPaLCBlKqLB19kEmOwwSRQABWY7OuJCyi5I3eZIWV/Qbrjj2aGSYKpBh9KXig
	 4eITZGGCY4Mj3SnAJE6G6NUvNhjELmIZbx9uA8lz4Ef1CdUgUv3DNj/k7EpfmTJIZu
	 dqIS7gbbMISUw==
Date: Mon, 24 Jun 2024 20:34:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 00/10] iio: use devm_regulator_get_enable_read_voltage
 round 2
Message-ID: <20240624203426.1970ec62@jic23-huawei>
In-Reply-To: <20240623111247.1c4a5e2a@jic23-huawei>
References: <20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
	<20240623111247.1c4a5e2a@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, Andreas Klinger <ak@it-klinger.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 23 Jun 2024 11:12:47 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 21 Jun 2024 17:11:47 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
> > This is the second round of patches making use of the new helper
> > devm_regulator_get_enable_read_voltage() to simplify drivers.
> > 
> > All of the changes in this round should be fairly straight forward.
> > And as a bonus, there are a few patches to get rid of driver .remove
> > callbacks.  
> 
> LGTM.  Obviously only been on list for a short time though and
> some of these have active maintainers so I won't pick them up just yet.

I think most of the people I thought would review did super quick so 
applied.

Thanks,

Jonathan

> 
> Jonathan
> 
> > 
> > ---
> > David Lechner (10):
> >       iio: adc: aspeed_adc: use devm_regulator_get_enable_read_voltage()
> >       iio: adc: hx711: use devm_regulator_get_enable_read_voltage()
> >       iio: adc: hx711: remove hx711_remove()
> >       iio: adc: hx711: use dev_err_probe()
> >       iio: adc: ltc2309: use devm_regulator_get_enable_read_voltage()
> >       iio: adc: max1363: use devm_regulator_get_enable_read_voltage()
> >       iio: adc: ti-adc108s102: use devm_regulator_get_enable_read_voltage()
> >       iio: adc: ti-ads8688: use devm_regulator_get_enable_read_voltage()
> >       iio: adc: ti-ads8688: drop ads8688_remove()
> >       iio: dac: ad3552r: use devm_regulator_get_enable_read_voltage()
> > 
> >  drivers/iio/adc/aspeed_adc.c    | 30 +++++-----------
> >  drivers/iio/adc/hx711.c         | 78 ++++++++++-------------------------------
> >  drivers/iio/adc/ltc2309.c       | 43 ++++-------------------
> >  drivers/iio/adc/max1363.c       | 28 +++------------
> >  drivers/iio/adc/ti-adc108s102.c | 28 ++-------------
> >  drivers/iio/adc/ti-ads8688.c    | 59 ++++++-------------------------
> >  drivers/iio/dac/ad3552r.c       | 28 +++------------
> >  7 files changed, 53 insertions(+), 241 deletions(-)
> > ---
> > base-commit: 7db8a847f98caae68c70bdab9ba92d1af38e5656
> > change-id: 20240621-iio-regulator-refactor-round-2-28a1e129a42d  
> 
> 

