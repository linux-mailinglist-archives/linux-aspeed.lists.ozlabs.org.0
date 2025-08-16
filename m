Return-Path: <linux-aspeed+bounces-1988-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB53B28988
	for <lists+linux-aspeed@lfdr.de>; Sat, 16 Aug 2025 03:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3gh24Tk9z3cl3;
	Sat, 16 Aug 2025 11:02:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755306178;
	cv=none; b=VHCwUsSZvx7PD1x+8BhHxTshUu6dN/T5WEesJwZa6qGkbE/h+PskokAmv8QktGW+gcagpPbJgVh4HrAQr0ZPBj2SS/OH9Ur6ldFB27/vXDHg1skltyGTQIRLSDifpMyGAxKdXiZB/YP+tkC/ExisaPVUwCkJBdBWUbYDznG+N60Mld+emHBd5LB9+ULJg/71to36mRBX9lHzFlCUGuAD8Re/gq2LJCbFqYmCrWid3RWYEmAg9t2icHT1SvTiGvl0D12DkDk35eT752f0HzgDv1YxS9vwKlj1E6tdF+4CJzgQ5kn4tV42r5XPyEapvC7FyPi1oT95v/n5GxSE7pljGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755306178; c=relaxed/relaxed;
	bh=uL1GIBvtGp9qBxNEgGd9zVR3Ww4bteJizXBxx4LVKvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhumhdJmQWsD9brSEl9jGNY0wYu6LvgtRRgrHEHQV0lXYSny4gjJ5FDXeZFJkplRoShJGU98dQXiQ7W6X0zLQ76PTkdQM/aa6F/BgbKmaCNqgUsBVT+jmUKqjBiXVBYrbLusATtMdDwHeG0gjG6somfKXkorh9AdnaS4rLemeU/hGronZvQr64wEyGeOsigPHbG0YtPt75Kkbnatpk9HvZROgJzWEt5XSFeVumjEArtWMthqqC4ARBloqAcoDZ5npq94rVQ1gQcwcz1ydKzl/aCYDn+XiUwUozkGxhju1vOyGwdNNhdREGY1ScHB0Db8MWIfnQNFOtALlis8/xJB8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DtwVebt2; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DtwVebt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3gh15N5Sz3cYN
	for <linux-aspeed@lists.ozlabs.org>; Sat, 16 Aug 2025 11:02:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uL1GIBvtGp9qBxNEgGd9zVR3Ww4bteJizXBxx4LVKvs=; b=DtwVebt2cPukDWsmBxLRl1g78u
	DqhE4zATJgulz++m6XYvVtziVYvIva8IqXNIVL6e6nusqUoAoBwIoj/VEzHq9WN2Rva18nFtm3oTj
	n3MCpOlxE4z5lVZVRqcm/Y0gGM8bsjyo9Yr5/AbOcelka9ZkhUb1JFNC7PxJywNOKj44=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1un5Jf-004sU0-Qg; Sat, 16 Aug 2025 03:02:39 +0200
Date: Sat, 16 Aug 2025 03:02:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Add device tree for mgx4u BMC
Message-ID: <21ee5045-632f-486c-962e-9e2963f60ed4@lunn.ch>
References: <20250815-mgx4u_devicetree-v1-0-66db6fa5a7e4@nvidia.com>
 <20250815-mgx4u_devicetree-v1-3-66db6fa5a7e4@nvidia.com>
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
In-Reply-To: <20250815-mgx4u_devicetree-v1-3-66db6fa5a7e4@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> +&mac3 {
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to impose the 2ns delay?

	Andrew

