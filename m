Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E459799DA
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 03:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6SZM1yQFz2yTs
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 11:51:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726451494;
	cv=none; b=XNf+9Roc4eT3cxgy3Ewg/m/7oUar1stafplwzBhkX2pf9VvuPt/otP7sMJP9s91wBg5a98i5SfqF1/tzVVRBspGoJyfm4kvhmKvRZmD2sipi73kFbIFtW1Rmb3PKg+dQ612F8RBnUrs6cFpZqoUy6kHBn+nWSs/K0wJVA1pOj2FTg5V0kLNMT2NtVVdlQTh/PY/c3yWmM15dZRa/aPNmZl+HB4SjuDOWwbDqWbZh26WLcdq/eOkNYE2Z1paVQRVfjgZpFsmdzHUDUkON+kPGXyKJpqKVdNAqTa0C0+Sn4rrH47kvkNcmbheOOuktati4zYFVk4cJRC5rfpGlUkKK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726451494; c=relaxed/relaxed;
	bh=uZEaSeIL9EbteI4kOFz1NSnE7w9HpzPFiE8x0WksUXA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWWg9HwGYMRzCJtzIs28UzWaoHwg2tbZHUmLyrZ/BOQyP0McTgkAamt5jMyD7zytRTSbYqZHJx2z2yuPSmzJ0Y79oJP5Jdr9y4b+oKQxAlJWAhwaG5p7sOYDpI2smH9hwLXIdKBw6xORqTUnrMgUlLqqXDY1Gi3OXoNfWP7/kUT4w6K3i1hwbCIcymKoICgoxUQdnnI2FnNpd+5bVOlb4YpdgIghjPval5HEF2P6m/beMs3UJk5N2gjIuZKqiCeW4Y+pp4whQYpgnGqMc6OyD6o3pRlMUsq/Vmw6VuvGN7RvWtvyT5dbeb9tcPPOkuHT0z6VHKOC9WTyE2JEA0Zdtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CrZH3lD2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CrZH3lD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6SZF3qCZz2xB1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 11:51:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726451490;
	bh=uZEaSeIL9EbteI4kOFz1NSnE7w9HpzPFiE8x0WksUXA=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=CrZH3lD2I9/qXVN6rUU+bh4gfJZgmkfPHt9m6YWpsvjPIWqMCEHAKpvO0XPsHLNc9
	 xjFrwkAF5i7KEcog//0OIw4cmC6X/Q3r2zLe9nzCLIi5xc2vs1tJsxV9TGpHxK6bPD
	 oETSy2W1TCAmLkZuTqU7WtnTds6w5uijd90soOyhaCbZlhSfDt544ed6leB5qFSl7j
	 9EFRUHXc6D8mbY7CfBkk3uVaClw6eXqataajYwg3jQ1PsjYXbe3/eUGAP/Q3lqHHyM
	 jMEeFBnwlwspob5PnwwsKoXIWToVXEy/J14kxWM2dlslF9qWIrcq/GLZGqt1eua0yG
	 eEshF1XuTX05Q==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BE3F56506F;
	Mon, 16 Sep 2024 09:51:23 +0800 (AWST)
Message-ID: <2dc5f4bea2fbafa4f69df6d9ba167b8b62794e57.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/6] gpio: aspeed: Remove the name for bank array
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Date: Mon, 16 Sep 2024 11:21:22 +0930
In-Reply-To: <20240913074325.239390-3-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-3-billy_tsai@aspeedtech.com>
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
> The bank array name is only used to determine if the GPIO offset is valid=
,
> and this condition can be replaced by checking if the offset exceeds the
> ngpio property.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

