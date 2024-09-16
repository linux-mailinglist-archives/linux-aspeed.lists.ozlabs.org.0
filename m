Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BEC979A02
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 05:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6V8y2Bpbz2yV3
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 13:03:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726455792;
	cv=none; b=UHnufPJnoYzBYTLqFRMdYO9YSizttc4UV0uXlvCZQfhP2e16WUedv//e07azpd/gV3f56IAjX6Zm2apUZvq6LW3t9HM0ORDVH7enoMFtDKRYCd98m3sbqUrzLsDNsv3b+Fo5md+iAQnGBvP0RjZU5mI087pTMRvajZUgtqS29MA4Yh3FqlWxMCG8Trgdiv6PDs9ZXVat7SHq61FKz+N2tJBAu4A7OR7Su2nM/uMWDztBR25cF0U6EWyCJBSJ/fXlJaAZzsOad4+ntEujM+zcyZNS2RYTVrt6iwoMdyl/W0cJ1//i4YG6hUQD63JgXeRUWBrCbDCBfHPPSnh0rGbIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726455792; c=relaxed/relaxed;
	bh=okRapjNKLW645UiL0c7hWRusBuuLukpp5QX/qWB33u4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sj5Wg+jS25zqw3cpjTqPHrxumQAjpBMDObk/sYENJGtEfipB4CiI3hrLfn8PBwjaDFoRckA6tOfoz4S5byQzdmrOdBrk18NR7X+qKI4gVS4mNq5b4//B2jP32m3+lVpu0+K0Sfw4oA3wIV0hn/9j9ePAz0PIUINZEf9VKS89aa4jijPYFQWGnGdhjTuFkveN+eKjoXVdp2u7rjo85coRkYlzZPUsQqIuOtkXLoBbAbz7cUzOx6vNxa2svbjf7YsQvupWCKiQFz2vqZCvFuLcl07DQbx9MTAdklSf+kw1odXUZeu25bGTE+3qgw03V+TFNnszls5NVVh5Lz8gAjsejQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QEzKyZqu; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QEzKyZqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6V8w5vJHz2x9N
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 13:03:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726455792;
	bh=okRapjNKLW645UiL0c7hWRusBuuLukpp5QX/qWB33u4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=QEzKyZquXG705Rcy3D7f7sX/6t5Ei4Dzn9KZnVwPOicVaqMrgWjFnf9vzNBuCICi4
	 7QoKWunrmwbb816bOFUoHLczB0tD43ufehjPKczaYaXQ121eT8r9Oby1B0w8jDnQRA
	 q1ZFZtVVgxoQLYbhT3XZLBQSzfgvsGVh7nSOCX/fygfvCcWWURcf3wb5skfCSe8qoO
	 imR65Qe2LNzQ8+233phyIOATVg+qwd8DPORvgQG7/Uej/w/ZBBE+HWoRreGGOyb23b
	 bkFUhv2NkcPub5eUhkjh64dXpu4T3hIyZ+5J2+/7TMxnQ17wYKFE7DQaHWNRUwWlf6
	 UQ/MSrIUg4/4w==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 493FC65027;
	Mon, 16 Sep 2024 11:03:11 +0800 (AWST)
Message-ID: <7433f7d95a0a51eb54ea0b1c9db102adb029f946.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Date: Mon, 16 Sep 2024 12:33:10 +0930
In-Reply-To: <20240913074325.239390-7-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-7-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Fri, 2024-09-13 at 15:43 +0800, Billy Tsai wrote:
> Performing a dummy read ensures that the register write operation is full=
y
> completed, mitigating any potential bus delays that could otherwise impac=
t
> the frequency of bitbang usage. E.g., if the JTAG application uses GPIO t=
o
> control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
> sets the TCK clock to 1 MHz, the GPIO=E2=80=99s high/low transitions will=
 rely on
> a delay function to ensure the clock frequency does not exceed 1 MHz.
> However, this can lead to rapid toggling of the GPIO because the write
> operation is POSTed and does not wait for a bus acknowledgment.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

... are you aware of any other driver concerns of a similar nature wrt
the architecture of the SoCs?
