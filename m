Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 18B0D8CD0EE
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 13:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LpLtzae7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlQN55Tqcz78sr
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 21:06:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LpLtzae7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlQMx0Gmjz78nN;
	Thu, 23 May 2024 21:06:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716462329; x=1717067129; i=markus.elfring@web.de;
	bh=gYGpWw1dwKwYXbTMuHWCYz3vW9FamyeQy+MaNMDyXQk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LpLtzae7k7PGKt5CH/219ViPUnt0svgwRR965UkDeNCI5x1p1CkiWMongjV5X+lY
	 i5DLXwXw31baly1omeTzIDsy9UYDSoceCL5dbspMZPG7TFfUTsknbQeQ1KNvkU6SJ
	 yi9lG2RDA/RNG+MWsUNgWqQllc4FiJC1b++c1C4iJrWLCmYh1myPcBHEnwyVIxqR9
	 lOJbOw3GrW+GroY1xZrn4Eur4sZOVicyLx003vjF1JMYI1Xd/R3DPFqDZiDr5D9KO
	 FBQkZqS4eTLU3vTyl7iN8tCR2AgVENT46IVX9/hrRdDVEUEn3M6NQc51NsTqpR7Wv
	 sc++cHwgmJ1ixNYMzQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Vsx-1seoPp3Rq5-00sRYp; Thu, 23
 May 2024 13:05:28 +0200
Message-ID: <8fb9a0ce-0a25-4fbe-9a8f-c2789c1553fa@web.de>
Date: Thu, 23 May 2024 13:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 03/20] dt-bindings: fsi: Document the IBM SCOM engine
To: Conor Dooley <conor.dooley@microchip.com>,
 Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-4-eajames@linux.ibm.com>
 <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
 <20240523-armband-utopia-66892e08b90d@wendy>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523-armband-utopia-66892e08b90d@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o7i1z0ffw/sWelUqhm9HyOezHTgMOzYA8t77RncB11/ez3M/wDb
 UuHT8Lnovhq4bgS/KpsKcRxPEEVZN7YohbH5GTBSvC68ZjsJ5nlLiIth8Bi6K/J1+s7AYyP
 udETwbHCI0hsTmNHARRG8rN1YNiNf6d8Y1WYuTQxLOA6N/1dndf0oX/ayLfD7WUvt92/d9F
 rNyB2ahjl/3ti347klAOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KI+1kjpW9rI=;+qnjuxKLSMLhUuyHZ0TmL5l93GY
 OvI2k30qXI+RE+3HDSUwIoGgElWYXIK7FEEkTBEVlHxW1SiyCCs0BTNcVxn/l3Zq8Ws0CeIEp
 QZINKzZcaKn9eNu2Dz1kxEyuKrDPbu5c+Efj8DLZ/L6esJAhBn6LmkCwkfa+zQVEG13tJqNXU
 kSFF/zcKybqlqXCZVpYPxAclkNySRHgD4Al8iOHz2gyWwK08M6YLR9e8BBnv6ZJJkqK/UhwcY
 xMwgwZ5J11M8iMXAwLUTLmgZqlpHe8r5DwrQ8P965i7Ref2UBf5X3K6rxXiLcwTLX0oSDlbct
 tCduY4v6XpLjf5YCdSRPTXKozh4bjVqGD6WQYl1G98oSYMdTKDEmr5bcmiSDBjdvRUD1muufR
 vMjFEJa+D3F8t/QZd1CgqwYWaEdHx2Ljz+ROCADzwyOW4WZmyYBlmfyoYlYHlxpgeHFfEiUts
 1Uc1PYCd4gP2ATAudVgf6jhNFAM/K3JshCsb3FsCio+W5dyRrE7plE3ZmU8JBAk5aKhAn7KHO
 ZxzBvSQaCnYpXLePWBdRnq72MYcj3m/UMiCKcUp1id7vlts78exdPIp3ExK7eT2KQuX8OxJ5r
 kzMQpHCO89zrjba8ILgnGZMXhwHWNj/r1spWpImwLdQyDVWadzx1NJrAt9TxXC+8ZwpEZtlgz
 zWmEpkdGa0bXePLcD1v6WYHzRE+AGQVW1GpGu9vh5z4nX831O+Zv8X55N1Cqz+IInTsx0JDkH
 wxuVPJAHDrcpk5AQ/YTteexE7tK8yMP9vYS4hl+mnJBR6xLo8CReXEro9WmY8WDIW+o2XzDj6
 2xQNJRNo3NOosW4TSbQJsHJGB8/OljHJn5LkTaw3lHaHI=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>>> The SCOM engine provides an interface to the POWER processor PIB
>>> (Pervasive Interconnect Bus).
>>
>> Please improve this change description with a corresponding imperative =
wording.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.9#n94
>
> The tense used here is fine.

Is the imperative mood preferred for the final commit message (besides the=
 summary phrase)?

Regards,
Markus
