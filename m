Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6485302B2
	for <lists+linux-aspeed@lfdr.de>; Sun, 22 May 2022 13:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5dm323fMz2y7V
	for <lists+linux-aspeed@lfdr.de>; Sun, 22 May 2022 21:39:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gRd6cnkR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gRd6cnkR; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5dly1gF1z301P
 for <linux-aspeed@lists.ozlabs.org>; Sun, 22 May 2022 21:39:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA424B80AFD;
 Sun, 22 May 2022 11:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A55C385AA;
 Sun, 22 May 2022 11:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653219560;
 bh=R3cMWESMPtbduNLMaekRkB5cyJb+GEmehK1+zJSrB58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gRd6cnkRR7RnvyvMbZcf9kDtRG4wQIFgPK7fUE8YMQUW3nh7OKk/o5jwdlRonmbkd
 f16WOfqGqxgpic5zeIAeDtVEnED8jIBwcccLrmCI91zrJlCZuh/BgMLFTXDpxQ4ueH
 IkUbwDnUWsy3SPKpIMswF0nEv2iLJUfH68SlfFTy5pwdcMO0twrmDgLUuVoRerOuaL
 1T1H0H6weqBAGw4Vd0YQaVsmxMxsdD1WPUNKHRhgi5zQfVKkHzORlhY7OWpjkLhzF9
 pS4WZGdyTutITsw3euRcqmKpkmEZBJffE7MMx3xWoD5cC8gRjEgDZYmBDIfca0nz8i
 r9XeecNQrdxiw==
Date: Sun, 22 May 2022 12:48:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] iio: adc: aspeed: Fix refcount leak in
 aspeed_adc_set_trim_data
Message-ID: <20220522124804.7ec5940a@jic23-huawei>
In-Reply-To: <20220516075206.34580-1-linmq006@gmail.com>
References: <20220516075206.34580-1-linmq006@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Colin Ian King <colin.king@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 16 May 2022 11:52:02 +0400
Miaoqian Lin <linmq006@gmail.com> wrote:

> of_find_node_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: d0a4c17b4073 ("iio: adc: aspeed: Get and set trimming data.")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

In the 'hopefully obviously correct' category so applied to the fixes
togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/aspeed_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 0793d2474cdc..9341e0e0eb55 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -186,6 +186,7 @@ static int aspeed_adc_set_trim_data(struct iio_dev *indio_dev)
>  		return -EOPNOTSUPP;
>  	}
>  	scu = syscon_node_to_regmap(syscon);
> +	of_node_put(syscon);
>  	if (IS_ERR(scu)) {
>  		dev_warn(data->dev, "Failed to get syscon regmap\n");
>  		return -EOPNOTSUPP;

