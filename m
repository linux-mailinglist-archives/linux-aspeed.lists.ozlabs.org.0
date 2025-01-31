Return-Path: <linux-aspeed+bounces-590-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AE3A2396B
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2025 06:46:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YklJG4yynz2yn9;
	Fri, 31 Jan 2025 16:46:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738302398;
	cv=none; b=JT1yfJn7lyUcdzmKwhhYtxkA+OaHB818krbD8Z+zAZtT6h4PR0LOP7hSnFI7HNeT+A5LQrwkH7qgZpr+51PArXEpsKNbfOLL9yd77/bgBeZas/nh2NOo//nM8vVWTMB80T8+ttHXXqv62OfeaM10YrWp6lmOQFfHtPTaE2zEjrZp4EpnrVP8M2QP2k79/5Z3h2gW2LioNeSwxlcbhteIJxe3UBkd0GYSzwiSHEdr29ykknpDbv4gqeR96dBgwobJORMjJ/YMCMFc2ERaZpCiAlibOGG9b8hniR8oPdbN5ZXenJv89jGGpROfrCpE5oI4P/eTV6a62Mtlptqwe0avuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738302398; c=relaxed/relaxed;
	bh=8NY/iR4Q4dA7A11sL48cZCdsqtQhG1vg/GEGlJsRArk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PUtmO0oRmPUlynvROGODpdqtjnQXc+r/kKS9siGQHwsna2XTl4CDwi48vHe58NxFI0gMULwLYO3OUXfYvjoyuAffXREbWVwq37Zk8ItGj5wPFVWWVQAil5AvYgZtiAKUSY2MnbRdBp+HgBihgKVWe+m3dP0nLnMe9lDxIQowcHzcB7Rece7UXdN4FnyxynM/cRKEBJAy4mCfz8C+A3prt3XiutCN1G/csLF/o2cBes3k55G1J7wMidD8QOTJqXioTFnMEfrHFkrH+pAqEpTRTFcnmGSLkPncbS5usVo38T54dNn2Qt6pHyOkTbg6/en1HthW3LkV6Drk+sBLocOk2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d8nrsWh4; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d8nrsWh4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YklJG0LZzz2yRM
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Jan 2025 16:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738302397;
	bh=8NY/iR4Q4dA7A11sL48cZCdsqtQhG1vg/GEGlJsRArk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d8nrsWh49y1AOesxcW960F8AVA38BKdWEkB/i8k+fe6Z9ypS1Vg17JPicLxI4OfWm
	 GDORuenl603ne4ipO8FyZStgq/fgLGo8M2P7ukFbOv8wS9bC9QIm0oKZiijegxLYgk
	 YmsB+eRogTG88jJIWBkrM58dj4cs1AFPPWJ0CGNIpE2rtxKYQ8ARyjs0UR7OH4Ii2a
	 PvhcBYjlEp89Ytt+CLYjtAbEgnbwQV9dZoubpInu5ew1dJSvsWlHC+vYQpPY+3j3ND
	 Ex+As/hofMPN2rvxiA6sIFWy4IsNP7opKHv4fa4q5JWE0OefVhyEbyeCqypzTSQeDF
	 TpAnDFHNKNUig==
Received: from [127.0.1.1] (ppp118-210-186-162.adl-adc-lon-bras34.tpg.internode.on.net [118.210.186.162])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B75471747;
	Fri, 31 Jan 2025 13:46:36 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
In-Reply-To: <20250115103942.421429-1-joel@jms.id.au>
References: <20250115103942.421429-1-joel@jms.id.au>
Subject: Re: [PATCH] ARM: aspeed: Don't select SRAM
Message-Id: <173830239611.118418.17158541895628336713.b4-ty@codeconstruct.com.au>
Date: Fri, 31 Jan 2025 16:16:36 +1030
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 15 Jan 2025 21:09:40 +1030, Joel Stanley wrote:
> The ASPEED devices have SRAM, but don't require it for basic function
> (or any function; there's no known users of the driver).
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


