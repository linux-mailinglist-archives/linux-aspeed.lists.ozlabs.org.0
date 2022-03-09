Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA74D3256
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Mar 2022 16:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDH2B1N3zz3bVK
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 02:59:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.43.201; helo=4.mo552.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 4.mo552.mail-out.ovh.net (4.mo552.mail-out.ovh.net
 [178.33.43.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDH2637Z9z30jZ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 02:59:24 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 857422400F;
 Wed,  9 Mar 2022 15:59:21 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 16:59:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0024454cd86-b8f8-4a4a-8006-1e6d8458172f,
 66B1A16360805881C0E6A53C72584B01DC44DA3E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <618a4361-ca04-81e4-99af-f7d9a3a0b7d6@kaod.org>
Date: Wed, 9 Mar 2022 16:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ARM: soc: aspeed: Add secure boot controller support
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220304030336.1017197-1-joel@jms.id.au>
 <92c2301f-5759-c13c-84f6-52ec69af7de6@kaod.org>
In-Reply-To: <92c2301f-5759-c13c-84f6-52ec69af7de6@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8bb984c7-8e9d-4d6b-8eb4-f72c3a5cc38f
X-Ovh-Tracer-Id: 14904944442090163107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfhfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepiefhfeffffegtdekgedtkeffvedugefggefftefhffehhffhvefhtddujefhvdeinecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

[ ... ]

>> +    sbe.abr_image = !!(security_status & ABR_IMAGE_SOURCE);
>> +    sbe.low_security_key = !!(security_status & LOW_SEC_KEY);
>> +    sbe.otp_protected = !!(security_status & OTP_PROTECTED);
>> +    sbe.secure_boot = !!(security_status & SECURE_BOOT);
>> +    /* Invert the bit, as 1 is boot from SPI/eMMC */
>> +    sbe.uart_boot =  !(security_status & UART_BOOT);
>> +
>> +    debugfs_root = debugfs_create_dir("aspeed", NULL);
> 
> may be use 'arch_debugfs_dir' or is that the same ? and test the returned
> value as it can fail.

Also, CONFIG_DEBUG_FS is not always selected.

Thanks,

C.
