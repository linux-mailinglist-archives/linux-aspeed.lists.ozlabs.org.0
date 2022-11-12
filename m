Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F6626A8E
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Nov 2022 17:26:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N8gvJ0p3Cz3cLW
	for <lists+linux-aspeed@lfdr.de>; Sun, 13 Nov 2022 03:26:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YhUUs1GB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YhUUs1GB;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N8gv8127Dz2xJR
	for <linux-aspeed@lists.ozlabs.org>; Sun, 13 Nov 2022 03:26:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D8F7CCE09B6;
	Sat, 12 Nov 2022 16:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB22C433D6;
	Sat, 12 Nov 2022 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668270400;
	bh=DU7lN2jn2h5AvAxcEVrgCYxlghLaUSgtfiNLgt81iA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YhUUs1GBbCRTj5Vy4Vkjr9KUeED+f7/gp7ySPD6tMh5Ul5YAJ1B0NY9h0gU6y6Uia
	 1vswlcHzpR/9LiT8z9z1bu5D/R14tPoHoxKuK74EIuMPCCQ+3nLTXpTdNMnOx+Dsas
	 EJumwFsbaZ6ub7eKN0Q2zpvP4JN5yB7n+aSZpSDFDdwj+BKMQiurC/NVLFEYHi6/zi
	 gBX9/uBjHkNUiwGN40msKCFpCPrZM4y9mQ3m6WxATTuCef4HiIXl2p3rem8fevF7C9
	 V3pbS5Neuzpob0PUPTZgqQa2NLlbf5QjEiadigt5dmbHxoVefMtyCO9GIbaAMHVVuw
	 yH9nsNBp4m8wg==
Date: Sat, 12 Nov 2022 16:38:53 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [v2 2/2] dt-bindings: iio: adc: Remove the property
 "aspeed,trim-data-valid"
Message-ID: <20221112163853.5a9c8893@jic23-huawei>
In-Reply-To: <9ddc0bc9-c5cf-6c94-d15e-77a7a7e2b7f1@linaro.org>
References: <20221107091506.28630-1-billy_tsai@aspeedtech.com>
	<20221107091506.28630-2-billy_tsai@aspeedtech.com>
	<9ddc0bc9-c5cf-6c94-d15e-77a7a7e2b7f1@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, lars@metafoo.de, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 7 Nov 2022 10:16:31 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 07/11/2022 10:15, Billy Tsai wrote:
> > The valid of the trimming data will use the otp default value as a
> > criterion.
> > 
> > Fixes: 2bdb2f00a895 ("dt-bindings: iio: adc: Add ast2600-adc bindings")  
> 
> If this is a fix, you need to describe the bug.

Hi Billy,

Please pull forwards some of the description from the previous patch.
Key thing is that people may be looking at the two parts of the
fix independently.

Also as Krzysztof noted, pick up Rob's tag for v3.

> 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>  
> 
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions. However, there's no need to repost patches *only* to add the
> tags. The upstream maintainer will do that for acks received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> 
> Best regards,
> Krzysztof
> 

