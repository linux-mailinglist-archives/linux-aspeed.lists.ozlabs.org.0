Return-Path: <linux-aspeed+bounces-1865-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5FFB16A6E
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Jul 2025 04:31:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bstPv2kBhz2yKw;
	Thu, 31 Jul 2025 12:31:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753929107;
	cv=none; b=NplLKu1BQ50U2GOGvmh8npVL2/uXfqBsv3+gdP/t2wHfbYEWcA3BD7wJQ2BXpr20RtSFi/JQDnLwSZemlUQcXILoTtiejGo5goHeVRlSfC2FgiTKduyMeRFTU3MsiS5VKInDe5HqRf70yJReza6LJK5Qi0LJODfiMu4BzbFBLDbESdwgUcKbJKvLny5aXyvk8kbwauCmhwncR/EWvcFHh44Qvr5VaR5i/LT4qnLNLxnJhkcXvva+9Vqu8lhlNkQQfTo//V9vU9TdWUtcwAdwQ8cOsdYyjCPsm2F6IuWNAQcZTj1asxzTt1aBCmB1rmH7Kbq2IQFGIAc951Py8uRKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753929107; c=relaxed/relaxed;
	bh=qC/E2RADJBe2o2pvqCk2KKHQRYH+IEmQwtHFwnr5iwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3sxYB5ArpF4NpmDvqIWVg6bBd3TPEykAYQx9YywBaHlVmUNzMz2AJjXtyKblW0S+gSgEWGLVDhS8T8I08nqBJWcHFXAGkPdLrSJDOgaAnwS1W0MC9ui44D49Mv4oKPer4bu4fwWAbA6kbduBGAdZvd3kTdNdHrhpX7O3aVemMldV7yAGaPQFjqKaJBUVzj07S9UNUbW2eZYzjLp+1K/4j97ajNJHodxCl1DiK0pupo6oFGAr1QvHR7xfSR8FaM8wnGuJ02mq9ej7x9fZwh+xFcX9E09a9KXzgVuIVlnCOYyXvhwXlr31UjH7Pt/jX3c4z16A5PSh2ARoBJb6Jfhyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jpD8b/DV; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jpD8b/DV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bstPt6rkbz2yF1
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Jul 2025 12:31:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753929106;
	bh=qC/E2RADJBe2o2pvqCk2KKHQRYH+IEmQwtHFwnr5iwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jpD8b/DVVAgtp1h122tIwK3VBpNmdsv89LZTDZPmo+lBU1vvD7FA7xo8vscY3HnAZ
	 wPyUojKTq1SkOUCMsVL14wfeezHkuKYrn71CFo9cv0zvNRDkjEHlRIDCcMsPcJOEgN
	 9+xLwAnXXn83RsRds870LwdRtVD5B6FYTqNeJsRgfsGgHneTO8BiL6PfIWNQq+ULNc
	 R6mz2k721/+5GkM/yk8Atl9oQ4pfUxOjLr4e5BzMBRY1tmmGF8V9x4ze3FcUc8LpwY
	 BnN7bD3R2pW4Rim37im6TErL1U4Vue8mzKnvi/Cpm5RijGnpWr88w+gNzxOwT7u/62
	 KNHsGWSPtOC7w==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6242A69374;
	Thu, 31 Jul 2025 10:31:45 +0800 (AWST)
Message-ID: <6f4b31063bb83a8b8c876ac6ebfdf7d1efc50987.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 3/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com
Date: Thu, 31 Jul 2025 12:01:44 +0930
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
References: 
	<20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
	 <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-07-23 at 11:42 +0800, Leo Wang wrote:
> Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
> description, enabling support for RMII3 and RMII4 interfaces.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)

This patch should be ordered before the patch adding the devicetree
that relies on it.

Andrew

