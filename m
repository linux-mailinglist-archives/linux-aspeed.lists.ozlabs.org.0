Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511787E301
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 06:22:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I5X9AZUi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyjsq1LBnz3cPX
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 16:22:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I5X9AZUi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyjsh5Lzkz3bbW
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Mar 2024 16:22:32 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4FA0B20127;
	Mon, 18 Mar 2024 13:22:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1710739350;
	bh=kljGaswYbucYPBzo1dhSAlIuez+sBxmTUtphzAySq2g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I5X9AZUi/jcObcfcchlCNtFqnGAP0te+ANL7qRw31ZDtBMGHU/Nnq59TZoTHBtr5D
	 /XkVEUwo41QbmDkAJNKJlV0LlZru2ki0ua00RVKJi05r36SZVHoLGmuzt7WAPxDDTi
	 LKezi8SvtgAjmUtgq+tAGqwZWAdgVVYnKrje4THQQGmifN23Fj33QyaJeSvz1ckwtq
	 QTVyDHtshJfH0WW/OhnlIRPcS8q4Az/94S4ai1pmkVO2J5H/csNxWnMmHjh+ubhhGC
	 SAyitx2KSCH+y8SAPy5WATohqRNFAV1LIzsnPHyKUlmwpzcXCnGYJBxR5Or8cbi/2k
	 jXYBxos45l9aQ==
Message-ID: <25d9939b599cdd40cd47027a86bca63f0acc271f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 00/22] Add i2c-mux and eeprom devices for Meta
 Yosemite 4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz
Date: Mon, 18 Mar 2024 15:52:24 +1030
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, 2024-03-12 at 14:15 +0800, Delphine CC Chiu wrote:
> Changelog:
>   - v6
>     - Revise i2c duty-cycle for meeting 400khz spec

A quick spot-check suggests that my comments on v5 haven't been
addressed. I didn't receive any replies to those comments either.

Can you please either discuss or implement the suggestions before
sending the series again?

Andrew

>   - v5
>     - Support medusa board adc sensors
>     - support NIC eeprom
