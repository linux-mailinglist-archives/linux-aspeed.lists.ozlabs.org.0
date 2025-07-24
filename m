Return-Path: <linux-aspeed+bounces-1824-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D0B102CB
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Jul 2025 10:05:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnk8T52m7z30T8;
	Thu, 24 Jul 2025 18:05:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753344345;
	cv=none; b=Av3poqTgibsj4kIwpS6fCk7R08UcAWZBJAmx+++ynXfNETQai/iIW9Hs6Z69F3Zjuwom2nGYKVKs9b8SKpcaionffCsEi9G63w0HKBNJ90iaIdVXMLSKhgESV5m07lb8hBAdlhU8CTKq4ou0DWRFoNvlDkYmpuXw7j4gsUr2lcTJjZnww8Od1b9OUouNcNBUvsXidzbWsrucTEF8G7L/oUZCmr9w8KeWnm7cV+VzfyFXt5/o+zIAAZehW6J4skI+OWbOvdIUom1GE23eNtzgu5qoJs1GrZqPW1GWec+JTRif6NODQWzN1yu2y12hvPh/+OiFsrFa246umlQMirTC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753344345; c=relaxed/relaxed;
	bh=MRFZSKKh935OBJE8qpoSceVGNtpTGpXTpzGaVT80ID0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUY1/jZaGjsJUrJV6s+b+56tytC8YP9uhH1AAiP84GWUJ2fIc/mbcDaBAcgkUfsVscBm+tQDLuWm1gWXo5Th5VBLXKxdRpkPgdN8Us3/29qp/gAam+vDg/lxSD84ULH7KyDiyBeuSd3OysW+zMp26tjQODMe/YTGyXj1q0whC6FrTdeSP6DUx9ym0jKs/6/vsQDe4U9+Iy2UQeByTha39qjKArIv48dSiJxrpRcLNq/bo7tcgjehtFOLabCyA07lnZC9U/RV9bm6XiFZ2X+0J8hssNYW1oR3zm/SoLVWwr6ifZTtZixhPi/2Xif48JKutRZ1CD0np4ySNLJfPyFknQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMwAL61f; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMwAL61f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnk8S6RCnz30T0
	for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Jul 2025 18:05:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1166D460C5;
	Thu, 24 Jul 2025 08:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D984C4CEED;
	Thu, 24 Jul 2025 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753344342;
	bh=QQ/KUR9EUnReinV6lJwLLr0fnjQkBu0aezOtyeBubts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMwAL61fiSNB5XAz4p2SUVMSHj4GsnjdjPunEMS0CWrz2TCLkANqT1xzJUjRcvNQQ
	 cQkv0TRaEDZPgtV/oigHfWj/+Jg0O8D5V60g8GM+VKvxpZK10wM07tYX4W/VwSBTqP
	 J3/eb9Y/iVNqRoXHHTxLaDbJ5VCPFP+zuW42sBCSWPEXyX2sTINfI2n2fLboGF12S1
	 VYeXT5EmMHp8MMMSjmlnRfkxU9GgHbBpivtR0cZ5vqAIkkuheWdCZ8gZWKkFpUOZK7
	 dYImub39SSfDGHOv3KPnDJYEr79kUA+uz9E/gc4E0EJdR+yIPYh+tbtO49si0YyCJ5
	 4yQkyHskw5vqg==
Date: Thu, 24 Jul 2025 10:05:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 07/13] ARM: dts: aspeed: Add Facebook Wedge400-data64
 (AST2500) BMC
Message-ID: <20250724-overjoyed-panther-from-camelot-f2ff4f@kuoka>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-8-rentao.bupt@gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723233013.142337-8-rentao.bupt@gmail.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 04:30:03PM -0700, rentao.bupt@gmail.com wrote:
> +		/*
> +		 * PCA9548 (11-0076) provides 8 channels connecting to
> +		 * FCM (Fan Controller Module).
> +		 */
> +		i2c32 = &imux32;
> +		i2c33 = &imux33;
> +		i2c34 = &imux34;
> +		i2c35 = &imux35;
> +		i2c36 = &imux36;
> +		i2c37 = &imux37;
> +		i2c38 = &imux38;
> +		i2c39 = &imux39;
> +
> +		spi2 = &spi_gpio;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +		bootargs = "console=ttyS0,9600n8 root=/dev/ram rw";

Drop bootargs. You are duplicating stdout path and choice of root is
definitely not a mainline user friendly.

Best regards,
Krzysztof


