Return-Path: <linux-aspeed+bounces-2016-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C9B2EF25
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Aug 2025 09:12:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6vfY4h3Cz30gC;
	Thu, 21 Aug 2025 17:12:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755760373;
	cv=none; b=TMtfvSr6Q/wF+QiSMoXaUVhmOJ+AN0KBpOQS3Dob1wOfk44MtW9TTzv7jVnlTQpvHlS/WHsMv/xn5iBlmj+uVBp/jc2WMhtiv5k91NSLv0PxtgOSQKZcBVvLtMD5QhOf6QrlPcUFLWimBharneYMpuzzzb01NxAFLj7PV1T2cWEma9plaOIFxJf0xaNRrU36bfpU8Z87g9YN9/Pz3rgbR6ZZj4+NtJcpI8T+JQ6TK8O24bFlX0mX1dsB0DLnrUgUoO0MJoAoS0VQWCbjDItjhPA9UeSAjhgrXBp3AuEGWj4xpSyZfR6KBBlYxdLNvlYy4o3WIZHD2xHSOQ0jeKDSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755760373; c=relaxed/relaxed;
	bh=V3eHqZZV2gqT+p9Q8iQrUB9KYNIfrSpCQhcQKHtEUIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDCrkZMrFgG28jMw5kfxsXh6O4sycQE5pH+vXSCV8PgPn5UbiA29lRxb5CprCmRQtz0IDOH45KOQ22xXlrSZfHyqyu0s0zWurFyzHaH0LO/YmZnFHZ8O3870fX7RCt0iVZPnLUSM7IX+OOoruQ+CkfNQP/GEGOIq+B1cjzJHQdlgRevo5xva8hQXvLy7RRR1R6VLG+BZD+fRjUiuCbuNP3iYeF8pV8jdDV53b3iLfInA13d7UIAXKRoE2yRPu1spxbVNdPs9WW/gQMyIuuhUA/H4+Aa4PgAI8X/sknGYVSPYos2Mih9/Q8EzOpfiU3O0DwT0s52JoX508PBSRgU+rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iZEfGI3p; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iZEfGI3p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6vfY0gJbz2xPy
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Aug 2025 17:12:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 065704568F;
	Thu, 21 Aug 2025 07:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAC0C4CEED;
	Thu, 21 Aug 2025 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755760370;
	bh=FWxGFvQTaapdzLI5+1ZbNCfPnYXpL37LgOOTiok+nck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZEfGI3pJKC9x4yDuPEq68uBSePJeLjOV2zeQcPAYB5XSTyIwmUlLRJ9XCCHlZuUN
	 VKYCEtB0SgE/aD5TiJjZEq2/xBepqr+TuppMesuM54MKLrjAEktHTdbDFVm+0CL6Hf
	 iMVrraKV0wkBlcCHqcUg9Ewm/AnLzlKxQ+hnmbmLyDofbTQ9LWX3MIqcdl2aOfNngY
	 gW7BdGcMS9sT3y2i7+QzSQ/8Uj0A7bJYTiu4odA6EqfbcirtmdIDEJ2UBWsxOiaEDh
	 loGtM9wvwiiKqJgDcaKLantSxlmluUD3S085Kl5hitaXbBBm0OdEbRGg4m5N70VVf1
	 duo1x7hp/wZ+g==
Date: Thu, 21 Aug 2025 09:12:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add Nvidia's mgx4u BMC
Message-ID: <20250821-bouncy-robin-of-witchcraft-0bef2a@kuoka>
References: <20250820-mgx4u_devicetree-v2-0-ccd2831b29ac@nvidia.com>
 <20250820-mgx4u_devicetree-v2-1-ccd2831b29ac@nvidia.com>
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
In-Reply-To: <20250820-mgx4u_devicetree-v2-1-ccd2831b29ac@nvidia.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 20, 2025 at 06:32:51PM -0700, Marc Olberding wrote:
> Adds a compatible string for Nvidia's mgx4u BMC board.
> 
> Signed-off-by: Marc Olberding <molberding@nvidia.com>

And that's it? Why patches from nvidia repeat the same mistakes over and
over?

Best regards,
Krzysztof


