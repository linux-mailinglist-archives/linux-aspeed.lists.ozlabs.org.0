Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 662CE8CDA3F
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 20:56:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=s1eVKv++;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlcfz1jzQz3wVN
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 04:50:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=s1eVKv++;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlcfl6ylXz3vxW;
	Fri, 24 May 2024 04:49:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716489931; x=1717094731; i=markus.elfring@web.de;
	bh=1/DkOOQ4p76I7N1cOX3SyNy1SPrQRKac+fkgkHwVk6M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=s1eVKv++fc+IwvW54Uw73nfZWda+mNvKUummXp8coUqwW9HDA6CvuZL5IAnNZ+AJ
	 D/1fHo4aRuomZP55p09D/XTF4P8O1uSlPRPcCFXfiFc/D7DDTSvuXtZUdRQWcEU/d
	 S6xzi7iwAL9cK/9jSybRzQ7B/4or2+N2w88SeOU4rTiXcboJNBLpjvefMT0OT475u
	 +YQRGC+HLbLHrqquIFKo/rDH0FYkxq1qA7L2bkh9MqDytIy4RhFkSx/rARwW6y0bj
	 LDb0yqDcYR0z/Pk1ByRUDPZHbRUt3iSsnzR38onSuqBo/ILmSCbp8/DaCbCOpEY8V
	 jGk8mnLSW8uaOKN+hQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1sr0O70paW-00jHkR; Thu, 23
 May 2024 20:45:31 +0200
Message-ID: <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
Date: Thu, 23 May 2024 20:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-18-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FTGLkl+0enI/p1XJo7ZYK9LDrqNcg7b95/RXLCF0nXZ68DUQmlS
 iC7OTWqBrdhVzfK8t14Oai0zRoXTIqXjxUBLL0eq4ajmSllyoBqEhyia4p55PZZJiJEZr9b
 05Py2bbsvv3gqPowLi4lkqommtD0oK3RaiC38w0vQvuWe2qrfZBxVPJ3afDNWacBxveWpyr
 T4QGfXQX8Ybt5JAQobbRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1VX0rS2Imqo=;0iFIBxOIEJruT1gIhSJRlAUIV2o
 tFYgI/LeHVdXNXLpS24mCZL0a+GLOzMLP1NsCnoO507izamlEG9b3D75OJMOA3ZHeAWAEban5
 niWzLmdAA5GQeIyrkeKI3MCisB+uDDMKbLxqTovcD6YI6+jnPh5ZgdfTbte6YZwAnHZrZWsmy
 972frGfk2DJF7Kr9yADERe9ti59Zu+hbb0J4a4h05C5eFahLvbJVQT+oC0jqdLfQZryowssxU
 QNa/MjQQdOqXkX7S4um1Jn/xyK9X5AQtANyGm9Mr+YhZiJ2mfJ9S6fGfU+PPFbqch0JQGIT/d
 XQR957FHDLbcd0gyn2iwi0uAYB2MDBMAJ27/Q9gzMoIVUYouOtU1XpP9tqhnyJdWRi9IKiR2V
 +ANocfPHhJ7CEj4ehQxta/AZZK+NEpbTh2p2IeuIliEwKyJNGsdS/jq98XVKEVy+H0H5c1wyP
 Fe3Ye9vA21R3MemhzSENqAfN6HyHb94oWcrNPviMgUt2EDZ2qX8GV/WXfRHZtZOCQKv00ZEVs
 aeev7JpQyLyi850aQC/t9kKi6RzwRFoM9Mdj3MAZYXoBb5+e7g4EvDJn2U4TNDqgvedn/rLL9
 yPg6sukD554R6FHhNkbXMoZ8KTUj7t49/QAhuBAhHivl3+bV961bacwJmAmmADdkIHaV0nXjn
 lWlgKQNaP4lm0SA5SZS04WP6L3Qz4Wpwuq70ukfdeOOqLIKwmQK/e+YA/1O2NmTtG7azMzp59
 Y8yFCRDTyr7eSWxWpKOHeE1M+M8f/GC1QWYUf7CL5RL0pPMwLCSlzqXxTl7c0QXalNDJ5gQEi
 B/y1EGEUwBLSbTNuEpZbHDRkG+y09LFLmiJDBTvtFahlI=
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

> The Huygens is a Rainier with modifed FSI wiring.

Will imperative wordings become helpful for a better commit message here?

Regards,
Markus
