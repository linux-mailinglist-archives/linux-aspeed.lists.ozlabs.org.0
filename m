Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E059899C8
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 06:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH7cG59Yfz2yNs
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 14:38:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727671100;
	cv=none; b=jp9ohN51XA2yAT5lEISwixBSbD0eY/+mS6NrPTEbZuvCfvCc8bCXFapqMwYp5s+66eN5KeDqAkYFYvIdAh/0PonyFwc0n1aalRKgsYOwyM6zl5LVZ50j0QiSMMSDgbZAvspF6LDVUoBS++4JXIg4I9Hvr6gS563wIt+qCuDV/oSvXHK1IrseOBCGWIGI7gf+zZDZiCHC5oT9xRQw8+rCWPfv5dlcMzhRXS/kx0NDQQxuWRg1rlBiekKAaNFq6f/dPkksJ5cNfjlkcifKRWD+DIiLfL8YnlwMPGTo6TnQPtiwx1FDU1ROyKVLnaO//5v6YX8dp0FD+VCnnfL5elLzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727671100; c=relaxed/relaxed;
	bh=URG6eboprcEIgY7CaSGCDE/rTne4uZU4fMz0sjWKlIE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFQWNndYXKUAAVn8KckeVqe8shHJbNCZ7xWxFk5F6q20Xs4hE3dM32+IY5Ln2whZIMGMUs4ukt337t4KF1VDFc91OKh0trHxTKuj8im2pLOLEhhMNsvGR8Sg1vYiPVN6ZlWVExF+BeQc/RtJmCenOI3BISPIB7B6Llw+xdovcw6qm30GcpcPYz4zFVKdpVvJ7mFDuPHfWi9BSkXUGx6M5a1hQA5mFXHpov1YEcwD6BFAtVpbqn3AXwxWQW/iOSH/1+0dCLaRL0ujpxTVnS9OUVScy09CJcRCViV/L6eYgNbLnDGj1P3uEmrt00Nu7Z/3mq6Gr2U1efiFVaoQNxqj0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=O9tPJYQZ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=O9tPJYQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH7cD4F8dz2xYl
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 14:38:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671099;
	bh=URG6eboprcEIgY7CaSGCDE/rTne4uZU4fMz0sjWKlIE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=O9tPJYQZXX6v1lvPJe58M3PJkTSW2Zr9Z/2oUAfOLHIohUWxFyR+xJp6/FBryhWcb
	 c5nrWXh531GidqIlFPcrapJkD5T1MXJTFFkxHZCQtIXR2rMqhtam3tjbDsSJdUOeAs
	 IMuo2jwNuWHIGDH7oGy7kYpQdB7mNZpWRR/D2D9zhHTYwLrxyj/Wq56pH+XNclixX1
	 vPyUOD33mUzFWEcxrmuT+SpASrj2TFl1OcUMDT2DKi5zFQsZZQJWyrgQteYM+PZUl5
	 C9wsK4Va5h5eSeQOo/TDXbgGQiJsNI9gfw0hlh8y/LR+rQyBNyJWRhjRKq4ulg74MQ
	 1WEkCJkmshE3w==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1F0E6511E;
	Mon, 30 Sep 2024 12:38:18 +0800 (AWST)
Message-ID: <97163102cad92e9bf6cc3609295a27af60c8df7e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 6/7] gpio: aspeed: Add the flush write to ensure the
 write complete.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 14:08:18 +0930
In-Reply-To: <20240927111744.3511373-7-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-7-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> Performing a dummy read ensures that the register write operation is full=
y
> completed, mitigating any potential bus delays that could otherwise impac=
t
> the frequency of bitbang usage. E.g., if the JTAG application uses GPIO t=
o
> control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
> sets the TCK clock to 1 MHz, the GPIO's high/low transitions will rely on
> a delay function to ensure the clock frequency does not exceed 1 MHz.
> However, this can lead to rapid toggling of the GPIO because the write
> operation is POSTed and does not wait for a bus acknowledgment.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
