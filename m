Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D3694048
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFddk0NvKz3c79
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:02:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d7gAv7cQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d7gAv7cQ;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFddd3K38z2xdx
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:02:29 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9AD4720034;
	Mon, 13 Feb 2023 17:02:28 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676278948;
	bh=MRZUwSFMI2QcJCDR1qI3+EewYtKghEAcl8omlYVCeSc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d7gAv7cQg+Y77IUqlVU/KxyPOtpOa8z0rkZ/1fwDUcFVUrHOLArXwOPgtdvl7vNd0
	 iSdBGO7hmpGchESmxSqCMRgBC3Mir42hluKa7fxEwLCq48Q9GOVm+TVYt3rWi2qrw3
	 OltCUqN+9JFV63ZRm7FFqyLkyiqAkS79Op0jDk1ZfzGAAfjZF7r+ZO+RFe1qwShTBl
	 BPRsCu/1x/rqcmOAy/jQS7Z7Kj3QHGZh1gu3L8FnEljGjfFdITM2JYkk9X09YEhRKs
	 OAjTiKy3t9LPetttVW+qw3gnfaoYloRFPT4s6hKelb1jxPu9TyS5xooS7Tov+Izaa4
	 bBmUoIs08moAA==
Message-ID: <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 13 Feb 2023 17:02:28 +0800
In-Reply-To: <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
	 <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
	 <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> 2. This is not DTS. There is nothing from DTS here.

[and from, your reply on patch 2/3:]

> Why do you use subject prefix in patch 1 different than in patch 2?

Ack, will change to "clk:"; there is quite a mix of "dt-bindings:" and
"clk:" on the changes within this dir. I'll unify across the series.

Cheers,


Jeremy
