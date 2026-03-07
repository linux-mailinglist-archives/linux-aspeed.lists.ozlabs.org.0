Return-Path: <linux-aspeed+bounces-3619-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBLlGhoorGlSmAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3619-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 07 Mar 2026 14:28:58 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B196722BF5D
	for <lists+linux-aspeed@lfdr.de>; Sat, 07 Mar 2026 14:28:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSkd04wvdz2xjQ;
	Sun, 08 Mar 2026 00:28:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772890132;
	cv=none; b=BeeEXn2eatn4gWI+e0kZVREpHtj2CI5HmAi9bD7ldFPgxOJfY/a76nD5k9REVPzBJsZre99ZzXDTD/z8+rDzieZh6cdbT08DFyv9IyB/WwQafOPl27TvJ5BsLqfO9snjkeWXo78espxNW+kll8679zvV9PyLR6+70qRqIPbdRp/8MnJVNE+W5iYRoSYi5TaOWejUsJuLAOIIusezoLIYNdu9LPWBo2+XY1sPe4lOhx/WFaG8bK+OC8Hc3fk+J2GczpJF6IUY4puy1TIe9yDTAykAPWI0bTA105zE4lC+Vdx0baZtAtNTcpwnhM0aBR1Mfk6jtStk0A2EomfOad1TtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772890132; c=relaxed/relaxed;
	bh=BN/XqjULFDgtRiOB3E9MoDZ6824EPp5tEaS/3lX1ByE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aD/QYd13vqJTlKSeExWK651PYNMHyRMdU2Gd3w6lDfU3qNRDc8nNhJbzTv595lNQdnx924055iUyPkp1gO+uOXtfe/8uSIrqwH+PaBCHYbBRbJ/lShGWMD9hTEvGrgVwSb3p4sH3W9Zuv1ejLm6TjjgKct5c90iM+PzmdEiJhSPojNytNQGT3HKhNXSzKRcKFlmFP55Dc3b97DKIam/G5gDd/t99735pZIxIdlDEi4Rpb+hK097JY2uVbBPfxDdsk49frcAwXloXtuznay4Y5H4OwFo4c1bGUY9+1NMmqb/88SjSTmgM6KJq8YGBcKH0Fnk9h4tUhA0Tdy/6QH6PBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q9Qh5YAa; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q9Qh5YAa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSkcz5q5dz2xdL
	for <linux-aspeed@lists.ozlabs.org>; Sun, 08 Mar 2026 00:28:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38EC74094A;
	Sat,  7 Mar 2026 13:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A82C19422;
	Sat,  7 Mar 2026 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772890129;
	bh=8vMTG5OOmCJMXA2EGTfUTjyjg7fRHm+MjrEBcdyE03o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q9Qh5YAaYT7I9ExOGO9djbucD5YhfFJ13NYE/MJnYSDI6iYvGk17fUPjcn3/NYlcE
	 U9ox2lxlTmx+yauXV4HI+gwBpf1msScL1beSra86vOGpKaAGR+fNwqWgsb+1TW/gAP
	 71NnB0g2jc5/c8ge4bu7Gn+TYbaoPw0kDd/RNBlmN7JcdigFjleGNwr8gg184EIPro
	 P3/WNcIciFPcQSEh/buVQ+FThAav0A8OkV93fEevWJRww5vhbQnU1h2j1RDlimA0/J
	 dsTFsF4FHTv2MGEobdTQoDwafnpufJouz70pHwEqbYIENDEeCrPJpuhiane0EWI1cq
	 adEBitGKknaxQ==
Date: Sat, 7 Mar 2026 13:28:39 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] iio: adc: aspeed: clear reference voltage bits
 before configuring vref
Message-ID: <20260307132839.3126f5bc@jic23-huawei>
In-Reply-To: <20260303-adc-v3-1-10570f23d3ce@aspeedtech.com>
References: <20260303-adc-v3-1-10570f23d3ce@aspeedtech.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B196722BF5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Jonathan.Cameron@huawei.com,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-3619-lists,linux-aspeed=lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 10:38:26 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Ensures the reference voltage bits are cleared in the ADC engine
> control register before configuring the voltage reference. This
> avoids potential misconfigurations caused by residual bits.
> 
> Fixes: 1b5ceb55fec2 ("iio: adc: aspeed: Support ast2600 adc.")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
> Changes in v3:
> - Added the missing Fixes: tag
> 
> Changes in v2:
> - Remove Gerrit Change-Id's
> ---
>  drivers/iio/adc/aspeed_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 4be44c524b4d..83a9885b9ae4 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -415,6 +415,7 @@ static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
>  	}
>  	adc_engine_control_reg_val =
>  		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
> +	adc_engine_control_reg_val &= ~ASPEED_ADC_REF_VOLTAGE;
>  
>  	ret = devm_regulator_get_enable_read_voltage(data->dev, "vref");
>  	if (ret < 0 && ret != -ENODEV)
> 
> ---
> base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
> change-id: 20260303-adc-47e5bfdf89c9
> 
> Best regards,


