Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875B913972
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Jun 2024 12:13:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYC3YrP1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6Rk92vSxz3cWn
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Jun 2024 20:13:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYC3YrP1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6Rk40NXrz30VZ
	for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Jun 2024 20:12:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2232C61F5D;
	Sun, 23 Jun 2024 10:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DDBC2BD10;
	Sun, 23 Jun 2024 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719137577;
	bh=s3jp8zh5u3y1JESPzwVac2JNeSuI2Llrbi+/y+WuucY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NYC3YrP1gZnq036U9jv9mfQXcGC30x2y36w2BJnv8VWxiKrtcBthVuELstjgNHGBf
	 g0eO4KPs/mvekXEA4q5E0JEa5XQNgu4tAggzruSwDGVVS7JdMlUU3eUh4DZL0Dp96l
	 8l6IMRpnrq5z+Kd7qUfLxisyvDLus9GRQV0bh4/fnD8AhRdxY+rLEUwiPHsKZ+RE6j
	 AfwBs3ovHpvYDMNCp/em5cDWZtg57c16bSP0Zf0akAh/K4roGWos4TcwGaqo5D+Hk6
	 eVu4gaUH0ue6cjWs8su1J6m4S2LP/8qh04jTrqz3gqn2rDUYhjjzUH78ciN9pNImtv
	 k0bIKGudVb52Q==
Date: Sun, 23 Jun 2024 11:12:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 00/10] iio: use devm_regulator_get_enable_read_voltage
 round 2
Message-ID: <20240623111247.1c4a5e2a@jic23-huawei>
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
References: <20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
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

On Fri, 21 Jun 2024 17:11:47 -0500
David Lechner <dlechner@baylibre.com> wrote:

> This is the second round of patches making use of the new helper
> devm_regulator_get_enable_read_voltage() to simplify drivers.
> 
> All of the changes in this round should be fairly straight forward.
> And as a bonus, there are a few patches to get rid of driver .remove
> callbacks.

LGTM.  Obviously only been on list for a short time though and
some of these have active maintainers so I won't pick them up just yet.

Jonathan

> 
> ---
> David Lechner (10):
>       iio: adc: aspeed_adc: use devm_regulator_get_enable_read_voltage()
>       iio: adc: hx711: use devm_regulator_get_enable_read_voltage()
>       iio: adc: hx711: remove hx711_remove()
>       iio: adc: hx711: use dev_err_probe()
>       iio: adc: ltc2309: use devm_regulator_get_enable_read_voltage()
>       iio: adc: max1363: use devm_regulator_get_enable_read_voltage()
>       iio: adc: ti-adc108s102: use devm_regulator_get_enable_read_voltage()
>       iio: adc: ti-ads8688: use devm_regulator_get_enable_read_voltage()
>       iio: adc: ti-ads8688: drop ads8688_remove()
>       iio: dac: ad3552r: use devm_regulator_get_enable_read_voltage()
> 
>  drivers/iio/adc/aspeed_adc.c    | 30 +++++-----------
>  drivers/iio/adc/hx711.c         | 78 ++++++++++-------------------------------
>  drivers/iio/adc/ltc2309.c       | 43 ++++-------------------
>  drivers/iio/adc/max1363.c       | 28 +++------------
>  drivers/iio/adc/ti-adc108s102.c | 28 ++-------------
>  drivers/iio/adc/ti-ads8688.c    | 59 ++++++-------------------------
>  drivers/iio/dac/ad3552r.c       | 28 +++------------
>  7 files changed, 53 insertions(+), 241 deletions(-)
> ---
> base-commit: 7db8a847f98caae68c70bdab9ba92d1af38e5656
> change-id: 20240621-iio-regulator-refactor-round-2-28a1e129a42d

