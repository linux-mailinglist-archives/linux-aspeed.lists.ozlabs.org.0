Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC4946972
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Aug 2024 13:19:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Op8Vu+pE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbgG03STkz3fRf
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Aug 2024 21:19:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Op8Vu+pE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbgFw046mz3cQ7
	for <linux-aspeed@lists.ozlabs.org>; Sat,  3 Aug 2024 21:19:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34BFD6235D;
	Sat,  3 Aug 2024 11:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB12EC116B1;
	Sat,  3 Aug 2024 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722683968;
	bh=lOyA1wRVsmt7cpKCQc6GLcc736lzfvw7xmQM/TV67KU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Op8Vu+pEMuPnpuXP1QywYP78/2rnl2voJhIQM5KwJBAozUtkLWv2wv/3xYhLdZxDX
	 x1YuL9YPad9W2MLRuDOdHfE/UdLTe+SMJ6TzAqsOtAHdW/b8lyo5bC8A/F7vaIIwAy
	 v4Ln+OemHGKxMmf1j+vex7X+7ywuMZXU/dJjPAJZqFLuOVZBRboXtek9w17OZ120H0
	 ls2MNR1Pf3ColRuCZFeFd/hFX5LVH8/20tgEsqBGd6K6xdah7B55uEgApfygg4XTOg
	 hDo0E0AvlOsLO0k8FEm3RES12oOZHJmsrUYGJbeK+hjZc8iPHJjVURHCQ6yVKnora4
	 ESZD1t27qClig==
Date: Sat, 3 Aug 2024 12:19:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH] iio: adc: aspeed: Use of_property_present()
Message-ID: <20240803121920.19ab9947@jic23-huawei>
In-Reply-To: <3770677daec27d5cfa9c952ba03a77875bc24b56.camel@codeconstruct.com.au>
References: <20240731191312.1710417-5-robh@kernel.org>
	<3770677daec27d5cfa9c952ba03a77875bc24b56.camel@codeconstruct.com.au>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 01 Aug 2024 11:13:50 +0930
Andrew Jeffery <andrew@codeconstruct.com.au> wrote:

> On Wed, 2024-07-31 at 13:12 -0600, Rob Herring (Arm) wrote:
> > Use of_property_present() to test for property presence rather than
> > of_find_property(). This is part of a larger effort to remove callers
> > of of_find_property() and similar functions. of_find_property() leaks
> > the DT struct property and data pointers which is a problem for
> > dynamically allocated nodes which may be freed.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>  
> 
> Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 

Applied.
