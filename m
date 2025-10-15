Return-Path: <linux-aspeed+bounces-2459-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B880BE0DCC
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Oct 2025 23:48:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cn4Sz1ZrXz2xS2;
	Thu, 16 Oct 2025 08:48:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760564883;
	cv=none; b=YG3SCVo84R4tz1Nr2AVWlGC507eq4R2bzMjeDVG2ix8sq8W+6QcM37XTJT1W6ayTYpTxpeSLB13tN7YjzyY41DrMkfeKlSgHWBjjIYQ+84wN8NuF1/NHSOb07G8tp214JVFo+hJJ8WcO7SgPuatIzPvLmVXEvB5TeM1P9NzwsA5ZwHmjR+XvOqI8tm41+NGgSFUSp/oqQEE/KMntWCVsW0dx5A7bILIqRpfR4GlVa7sbREelONabhos/QCXUu1iYME5dB2qWHmuNiOutt9WAgyj9w4ip8I9EAF9z/dKPZmkK8OXvg6adfwJlAJDhcOdOQKTLaSKma/nbwGCsiXAl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760564883; c=relaxed/relaxed;
	bh=BJKRSA2/UrZpBwMZJMLqiGvnJ9vtCKMc8nR4m+Bp2vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N69/kO5wGhsaBqCfadzQIa7+yVBYUxkXqriF7ebDC+89t+N7kyPYBejW9UmBqdBeelFTfwogywz1lFkzSYfBQLIJhMKFClLGJFTIxJJc9kFMAI1jDKNtmHz4vN3FterS39kme8fes0RHGd2RKQ9R/efGrw12nXwqlhYBgcXqSY+afkhpExVNC/vS95zPa/nHsL+5K7At1CvQ+gY9njUcixj5E5FDFE7fgducQaDDzUHAYD7Kf66TzfaNVBxuWxhIws4a7zeokhYP69R6XvjV1kKfKM7R3+oFpc/0QKqHBjdmQtZNFrsI/bkybitp1zFCdhwyCJGrfERcqI8o7NDRjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gKFX8OVD; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gKFX8OVD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cn4Sw5mztz2xQ4
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Oct 2025 08:48:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BJKRSA2/UrZpBwMZJMLqiGvnJ9vtCKMc8nR4m+Bp2vo=; b=gKFX8OVD4AxfYUMWpmvDKQgeoP
	EfGtlIZLIs+J+AeSD5EwIrheoEEWfjMjayaJIE7qp0j+Qs+pJ27VxQCoBuuuaJW6am9znaAYFSH0n
	BGvFftZl9ZIUyCAqVVF8lYTpQE2Y5NWfFqLV6UpHOJjzd/TdqF9aE5Xj4m/OWzGIVYAw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v99LT-00B548-JQ; Wed, 15 Oct 2025 23:47:43 +0200
Date: Wed, 15 Oct 2025 23:47:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH] ARM: dts: aspeed: fuji-data64: Enable mac3 controller
Message-ID: <b0040541-31e9-4cda-9462-09b4a5622959@lunn.ch>
References: <20251015204840.80070-1-rentao.bupt@gmail.com>
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
In-Reply-To: <20251015204840.80070-1-rentao.bupt@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 01:48:37PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> "mac3" controller was removed from the initial version of fuji-data64
> dts because the rgmii setting is incorrect, but dropping mac3 leads to
> regression in the existing fuji platform, because fuji.dts simply
> includes fuji-data64.dts.
> 
> This patch adds mac3 back to fuji-data64.dts to fix the fuji regression,
> and rgmii settings need to be fixed later.
> 
> Fixes: b0f294fdfc3e ("ARM: dts: aspeed: facebook-fuji: Include facebook-fuji-data64.dts")
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Thanks for adding the comment.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

