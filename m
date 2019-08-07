Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5AC85506
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Aug 2019 23:15:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463knN5CGPzDqwD
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2019 07:15:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="evVShKsE"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463knD62GmzDqfv
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2019 07:15:44 +1000 (AEST)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D6B0217D9;
 Wed,  7 Aug 2019 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565212541;
 bh=mPs5ZRxH/plyzQCc3mZVnB4VCrN6NeDkFyiCjTFTVtE=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=evVShKsELYA/qJL/FotSY8uoAWZf/EbpbypuGS9QvppQIIUWYxHHjl70dzSqeF2/s
 BHZw3OUEZ0Nq7db9hOloZhWWBoVvcnV8fWciveKFPCSnX38Rq6WajRrhfbyJ1Zx9Gc
 1jmyIRmeSDb4mjzAWhRtKj/hmThM7QY0q3pyKpO8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190710141009.20651-1-andrew@aj.id.au>
References: <20190710141009.20651-1-andrew@aj.id.au>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: aspeed: Add SDIO gate
To: Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date: Wed, 07 Aug 2019 14:15:40 -0700
Message-Id: <20190807211541.5D6B0217D9@mail.kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org, mturquette@baylibre.com,
 ryanchen.aspeed@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Andrew Jeffery (2019-07-10 07:10:09)
> From: Joel Stanley <joel@jms.id.au>
>=20
> The clock divisor comes with an enable bit (gate). This was not
> implemented as we didn't have access to SD hardware when writing the
> driver. Now that we can test it, add the gate as a parent to the
> divisor.
>=20
> There is no reason to expose the gate separately, so users will enable
> it by turning on the ASPEED_CLK_SDIO divisor.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [aj: Minor style cleanup]
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Applied to clk-next

