Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C4975F8B
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 05:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X42RS2Jvjz2yV8
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 13:07:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726110434;
	cv=none; b=oyVGwiFZuCFbnTut57GUmx/v/O86hCNovQgOD5SAyVva1/5872fGlKwZ673ui4n5Jqlut5feyxzKYqD5KvdZetqR/oaFQQ0R2Li7emthqDju/r5d3jX+RckyLCclAZKUfyoLKEoxLVpNGFsVATxiMaWV8fB8uJkhwcguCXFGowDSo6d7YEzwUuUEA39dVgVdNrXnorYIIGl0lf/NtFExWmGCZPbY4OFwLWlK+xpcb4Mkfn5BkKZ+zPpFaldIcbPG1ArkWkjuhud+5O53XJICjHNlTbvyBgS4TEQDhVJ6A/0snhlglVbQUQJ58X4FRVTZsqU2gDraCsy0irUuOvWmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726110434; c=relaxed/relaxed;
	bh=S4ecD8RIBfWL9S4Sp6s2IFF7W8ILz/17QwDN3NU8wmw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kVYewyON4dPj6wObtCUuAkBB+n0EcaE3Y8j6cSttWtWL3zb3q9T7+6v3E7JR8t2TLO5g66WiDcj1mVyJlCr7YvuEEWX72KT4678TjbQPFG2+PAZrfPRVVeFMn3oihzW5Xn37osptQiTXcA+0NTpCZR2icG6hskeBUzHv2a3EhsR6WT+TO64zP5gQNE6/sqv6FvUYwuO0fj/SttDgxwcwmYUFKs+qE2xgPsYqw6n/qqv/AgvefpeKn/H8E/Fc/1HC6P8J2XTduiQQLopTDJjmuQKameXTHsJTCFaBFKwXPxPddLh/toVSGx7JJdGh8F0kMk+EQfyWIKdHVXBvdDiF1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gfoHxatK; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gfoHxatK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X42RQ4NxCz2y8F
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 13:07:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726110433;
	bh=S4ecD8RIBfWL9S4Sp6s2IFF7W8ILz/17QwDN3NU8wmw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gfoHxatKP87BUArUp2ptHZ5GZpN6lZiW7GpYxpM0Lh1ejtUTP9JzrH8oB+Now2Css
	 IqVuIAhg0wKo+QBAftZLGxHMKoa2J+ZYdf5jf7Gc65R4cB15c/3NltCXRLIaLvFIVG
	 RzU+xvIwIAar1ufRW/Gh+N0IKZBVb3DchdMc4ggycoxnVVmXNcU++tR/ZJzPu22ZHg
	 0lxN7lQDxeWKD1OAt3Kyya0ypcs5QK25+/gWMJrP+PHuENuc4uHnROeXfwemaQzh2H
	 jLhtHBIV3SU4GhQpj3RawTdK9+oLvmENtKuUvfKwRgWdGkAYAnH+rJbQhPvLK23k7a
	 dKVW3UOj87oNA==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6F44B650D6;
	Thu, 12 Sep 2024 11:07:11 +0800 (AWST)
Message-ID: <3a5fb92a32cd1d23029dce8a87297175858bf0c0.camel@codeconstruct.com.au>
Subject: Re: [PATCH -next] serial: 8250_aspeed_vuart: Enable module
 autoloading
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Liao Chen <liaochen4@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Date: Thu, 12 Sep 2024 12:37:10 +0930
In-Reply-To: <20240903131503.961178-1-liaochen4@huawei.com>
References: <20240903131503.961178-1-liaochen4@huawei.com>
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
Cc: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, andi.shyti@linux.intel.com, u.kleine-koenig@pengutronix.de, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, jirislaby@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-09-03 at 13:15 +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

