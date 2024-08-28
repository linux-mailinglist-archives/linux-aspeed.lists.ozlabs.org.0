Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3866962C1F
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 17:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv7Vc36KQz3bhD
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 01:24:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724858643;
	cv=none; b=c2o7PSqXTOCDreyzo2u1+YY32LbRzQPxUEJCoZIGb7LfG8ugRzsBL+kNt4U4F6hHo3UT+lHh3ZsLsIZG3CLeocxC/OGjrrBjp7cNbcuWrHpO17T2BBLRBvN14SaRBYB3Vp+OsgGli9UmutG2z+uSqIvPi+rsE1wuNQUWRppjd24+FRsApOSHykcbGfcbh5OEBo6/u+M841gwG0aAgZUt9Ggtp7OOkn9581r0MvNcUKryb0Hn/BjvO6EN/1HsmNE4ntKNk2y41czt2pCtzscjflv4ec7TxNzGCBo0OWvsgauasD+vF+bAL5zs4hmdC2kOD9dsfjoSCV/ZvT2LL+1b+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724858643; c=relaxed/relaxed;
	bh=CG4oTPD0zwywYFWX0Kb6mWWmoLCq85f/1yiRy7yIqc8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=lGU/ixBxV20nDqnVMRi0S1lA07y+eEMqSiiQf7VrQwO7tbaxJ6skKdEXhI/edPTflY168gxp43PU2BxhdhEg1/KpFpVcy2ZQiM0tpAHP7WF31kZ7oOZZuRWyt63g2YCIT3Fxi0dCd+sD+DU/mC5LlJuCQbPlbMBwSCdVGcZLIeiy3psKlTG1KFd/aoasunmyzbvbJ9O5QuMd9fsKPBvfsOSvzswR0CMGu3LWcI6877Wv6UggnbI0xeOCU1qJj8TP7qqdJ3orcO3Ixmp2wvBi8q/FP/XtZFc7M6oikQL3BVvhTFYrEUFVEcKaOdTdqpaTDDQEXl+ncXNGNlxwVp6eyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nrUNkWaj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nrUNkWaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv7VW1ZDsz2xYw
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Aug 2024 01:24:01 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e1161ee54f7so7445997276.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2024 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724858637; x=1725463437; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CG4oTPD0zwywYFWX0Kb6mWWmoLCq85f/1yiRy7yIqc8=;
        b=nrUNkWajzw25cmZ3erw+oD1ow5MIG87DUXLbxgUjEw/Eset/dv9DMBK05gfCX+to9M
         vAPCEUH0pbVDgmLw0KbwL0XuUbbdo1nHXIbp8Q8Szv4UQGYCiwZ7/UAhreRTl/H7qote
         idXEqUagHlGIOVeE5bzCEBwhwLTn+mkvcKR1gvu9UMoP3Qs62KLym/TnSf8qio33hP6r
         oOn3ePtd7h1M26/IWEhgFFa50+4/omRDHTSnf+ZxcDUr6JHbxVb4jJryeTyogdedYX2U
         qkm1Jwb8+SCT5s5q/ca87lETV9WFwbA4FAY61AHXm8AaN5osmshcXJJm9JuhskkRo7Iu
         cwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858637; x=1725463437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CG4oTPD0zwywYFWX0Kb6mWWmoLCq85f/1yiRy7yIqc8=;
        b=Bu93mUMLNy1G7rqTWnMYbaZAhMSlVHAz/D4iAsZ9McGVlGSbZuTlI99I+TugWK0E0T
         CUxADoKjtayfGc1hMr9MQBFl0opUzJiMIcUZgloEx7PlrqYC/LXu7JIgr/OIbVi9/MzC
         busun+RcSwn/jPBz6gckpQdZN6jmRNsC7qiKyXiHV06gGBnLoaBsWRyq/pMCq+3x9iat
         D3dz3XHxU1r78qmtnWJuOnTnk3lXdVKCLOQUWpfumYIa0VEW3hqrJo/0Lu79XKAtTaL0
         +L0C8fEK2phPKAUrQvMVecLliLq7qZOXHxtAK2V5ROptpsUws1elXd/Ir3SKo65OKTDY
         GYGQ==
X-Gm-Message-State: AOJu0YxN3hXcAvLegFEimS1avr7O56VFS7sSAll1iNqeNpKelih3bgwt
	qnnWbKnXZKEGQHZBChgz0lBHKpF9N1AuHil6QHteXn4k3IrB5rnAaaX6RF5ls9/ZStkDMhKJHgP
	RKhofgy38HQ05wEDiEpkNNIN4QPMaZ/jKvpA1qw==
X-Google-Smtp-Source: AGHT+IGrQ8fIZASydEMTPgJtn6QAWdCuqrWbDh+r3EcwsMgb2mqXieOzplvqVupD9INUYmMzBF4NNL8ZwfYeKBgNa8Y=
X-Received: by 2002:a05:6902:2847:b0:e1a:43fb:12e6 with SMTP id
 3f1490d57ef6-e1a43fb14c7mr3278001276.35.1724858637220; Wed, 28 Aug 2024
 08:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240826124851.379759-1-liaochen4@huawei.com>
In-Reply-To: <20240826124851.379759-1-liaochen4@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Aug 2024 17:23:20 +0200
Message-ID: <CAPDyKFoFH+=Q+h8zuiuopi+f4p63QUoj_qEn83YVBinh8PnKBA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-of-aspeed: fix module autoloading
To: Liao Chen <liaochen4@huawei.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 26 Aug 2024 at 14:57, Liao Chen <liaochen4@huawei.com> wrote:
>
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Applied for fixes, by adding fixes/stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 430c1f90037b..37240895ffaa 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -510,6 +510,7 @@ static const struct of_device_id aspeed_sdhci_of_match[] = {
>         { .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_pdata, },
>         { }
>  };
> +MODULE_DEVICE_TABLE(of, aspeed_sdhci_of_match);
>
>  static struct platform_driver aspeed_sdhci_driver = {
>         .driver         = {
> --
> 2.34.1
>
