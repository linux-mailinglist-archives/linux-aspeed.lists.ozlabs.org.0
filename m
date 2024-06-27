Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6C919D87
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 04:49:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZjtFqDAt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8jgw1C24z2ysW
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 12:49:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZjtFqDAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8jgm37krz3gGW
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 12:48:52 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D9F8E200DB;
	Thu, 27 Jun 2024 10:48:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719456533;
	bh=QRdGpdPwEF8z1guRBaFF3J8Ugc77/KDq1zotfXxXxRw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZjtFqDAtVuHtBXrtGvFabQOkgMmEQoFHAiTQj222vQC92t2cbTj0C2tJhwN9kBRpR
	 w024zJxvSkFqHrXGvQKyZEUbuJzrNvW+Jk2yKKI8JRMktBfbJR1TY5FiUNDSkNzG4Q
	 gV+zeDBX5nkFL2MzJIf1/WwPz8VE7YLEVY8uA+V9kPQ7hPJGmIW0LHQYmanqEvGLnu
	 /cYp3bXCODA6/+C3Xm/QCZVRUksrgD4S8NMl2c4sWMFCGmvjztApCba+zZc5vv5RjV
	 qcT/1yKnxBq8JvKw4QZ4PCsUn6Ajsh5gXp9HmyZCc1TAHrXw5JC3lLoqi63BfzV844
	 aI6YAXovI0HjQ==
Message-ID: <f7412b65e1844ea9f3ad9fe5825e5d1da422ad69.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 00/17] Revise Facebook Minerva BMC DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Yang Chen <yangchen.openbmc@gmail.com>, joel@jms.id.au,
 patrick@stwcx.xyz,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Thu, 27 Jun 2024 12:18:51 +0930
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Yang Chen,

On Wed, 2024-06-26 at 21:03 +0800, Yang Chen wrote:
> Revise the Linux device tree entry related to Facebook platform Minerva
> specific devices connected to the Aspeed AST2600 BMC.
>=20
> Changelog:
> - v1:
>   - Modify the properties of spi to match the schema.

I've put this series into a tree for Joel to pick up.

Thanks,

Andrew
