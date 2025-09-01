Return-Path: <linux-aspeed+bounces-2107-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F3B3EF9B
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Sep 2025 22:28:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG0p01Q13z2yqh;
	Tue,  2 Sep 2025 06:28:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756758536;
	cv=none; b=BEMOAEXHOf/aDxjayzwHQ3RsD3GzCuGGIxJbpXv1e9mBrLbtxWa603HbN3xQjX3Q3gFjhBkNqUeokFeXX1qAczyKft355HzRVK5LClPeXGOzaiYHSCZHU64WtGfCXguz5YhedWYtpu8yYXbk8JaQccGeuyHG7JjSvUYvT8IWKGdddvuVlGWVP0NgLIjOZfpvjlME1R5lDw6xh1BF0VjezreJWbgywEJk6ImLgdzovkMi/i3k0ZpkgkO0CFbRpReYMZDgB6ASVids7tapBU/hvXdgruthwGoGgd5Q3hzQEg8kVZsY1dW0OgVnY9L8h0bilOYYKW66mapzhn95I9XaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756758536; c=relaxed/relaxed;
	bh=FaKfpyOhV48+eruFeF+3slWhCgAaGl3pjb/el24qkAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvynL8OZucuZsF2MHmr9ekvdkaRD5T2D9t1KEJQg9ElsXa9sUMw3dpDv4R8ASSHF4HqiktUPsfkpxM6v+8arBzSrxVaDP+9cBMdeonE0Ry+yNdPNpLnT1nItfxSjjlWuvFegX4L/CtDKRsme6wBf1YJ3O4eHBPNIhZkrMaiAilcLIwe3PzsyQQxP4HSzuHJj1vFMg0ephZN8m4RD9RCuFKvxxpp9RyWd3wG2shhXhej6MzJs4h+hRUVf6Y3lRljHV5b1jOkzmexsk9B1prcNngJ8CTaUJbt6YBTiYsP8FUM2bGh2f8B9rAOLNXqA9Kq2mkl8pT24R4JuBWjX+8DNVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpaO8Y7r; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpaO8Y7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG0nz4yv7z2yhX
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Sep 2025 06:28:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23D6343817;
	Mon,  1 Sep 2025 20:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C1BC4CEF0;
	Mon,  1 Sep 2025 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758534;
	bh=7SiV0tTtklgBoJZ9EHxvqC7tkNgTkPNI3eeQVyIYD7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpaO8Y7r/l2VpKEAiBebCAMBitJO8bHZBiPh7MnlkhZjhDdpEo6qcWS2ih6fA9COa
	 T8BTXcARrPB64lBZyYp6tYd8q9wlS9KUMU2d6M+T5Km2wTnUUHKCgmsMQ5OYeaWJT0
	 ccM8t3mcujTClSNG+d9WA3SO5lPVLQpzhNvkDbVm4YZIARDg15XfXDeRQfbCoyXKDA
	 yIjHSs68+I1ys36G5ZKwGm2+0J8z6hRDDw8JWm1ECVXJfp5DYdv7KRgtCIL4uXMa0b
	 nct7Q6Twa7Rk4fAS4wS7q0nYKiUrU8q2c+ErKtkKShrfL+UNuC6RM5INg594m+B32t
	 faR+1xtMYTCKg==
Date: Mon, 1 Sep 2025 15:28:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-aspeed@lists.ozlabs.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: aspeed: Add AST2700 SCU
 compatibles
Message-ID: <175675853255.286945.13351927869745277477.robh@kernel.org>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
 <20250831021438.976893-3-ryan_chen@aspeedtech.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831021438.976893-3-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Sun, 31 Aug 2025 10:14:36 +0800, Ryan Chen wrote:
> Add SCU interrupt controller compatible strings for the AST2700 SoC:
> scu-ic0 to 3. This extends the MFD binding to support AST2700-based
> platforms.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


