Return-Path: <linux-aspeed+bounces-1590-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F5AEC11B
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Jun 2025 22:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTS785l5vz2xsW;
	Sat, 28 Jun 2025 06:38:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751056692;
	cv=none; b=Or0QHtmNCE7BkNUEVmOYD1ttFkuey/a2BAM9fTYshGfLX+IF0IEqjx9HQ3/+Tbg5iPAKkNbn81avZnRZJibJ+BWS6V6cTZN2seuvYIrzxWcj4jg+g6dEtZH+L4N/BjA6ZxUoY3A8y7+xXcsnU27qlcveINKEk7GRlYClZcZcaVPGTY84BoAcG5p42cWacDDbRMSCb/msPkE532VVtCAslTPI+EUevbJBuQ8FQuyr0G+4qnT+ulcmrvq54dXLU6BFQZLKt2tHqdwyuFt3uproBXvMfzdxvuTxyiYXHLTCojIEL31G5cpnTvN+cZG1e6dFa4TGRmT5/iZMPVADUAgqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751056692; c=relaxed/relaxed;
	bh=Gzsk+sCLhP2wDC9LPn4BoUyRFRzfkGfaURFuIu9Ie84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/n0OUu9WFYgYQmToWfaqGHr1igYx89/ee13dgmOi3pSoObQGlyZtnqpJDCTXSFO3net20p7DoEPefW+QF/h30TMVXrrGJhjb8VODjMMlGDE9NvF21QVYgskytZbpkEGJP6nK7fKvR7uxuLOdasL+1/OeDW61vknLZavmJyVrFy0mHSjtFhiuTjy2D4Ca899s87o7VJLVkpQMQ0E3ZfD/I61Jg+MRfqhDnvIGxvR4k060C+xWMNa82Ynd8SWmv6ID/0U22FzISIEKgXWUUgHASi8WFc3BLdLMyfA1LTZbPjtAO8ueduDIDANphjWfoPOrgtvvZtNc7dc1hKzinR6XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SKIP1j95; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SKIP1j95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTS773DLTz2xd6
	for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Jun 2025 06:38:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45FBF45EE7;
	Fri, 27 Jun 2025 20:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E939C4CEE3;
	Fri, 27 Jun 2025 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056689;
	bh=VLsRMIIbHkcIiBubCm2O/Vz1rQK6YmG+Kz4kjvRqN0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKIP1j956FjIIkOUncDjuT3hx0qNF41n5qrEKUpQVoCNQRT14I/QbIlMbuZZRzQGE
	 WRfRw3pNyPaFk74ZWQQM+CoP2UfMaiaJxc0Uyeqg19H/+YLzoqG40oymmerNEAJ0VY
	 qboL7vpIkacDV4GZNNg6iHvYpUYVYF/Q8hZjod64XS+BVejhySidY9eGsksc16/3r4
	 M0DLJZq5KxPIpXd2jPoPI9kzHAhW8/pPbYBZxtU1xNp5B73qdmGg3FEeGoUhf8gDda
	 uDGZujIMvAzm2buJq7BAJQIUf8rjlBKhV7Xgeo5j/CxSGy5uFMatAKJql1NZINKjSI
	 Hf1MqS/pHZYkw==
Date: Fri, 27 Jun 2025 15:38:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara
 board
Message-ID: <175105668797.42558.2699449089558464482.robh@kernel.org>
References: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
 <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
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
In-Reply-To: <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 25 Jun 2025 15:38:37 +0800, Fred Chen wrote:
> Document the new compatibles used on Facebook Santabarbara.
> 
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


