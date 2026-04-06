Return-Path: <linux-aspeed+bounces-3840-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNWuDvFA1GmRsQcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3840-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Apr 2026 01:25:37 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541283A81CE
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Apr 2026 01:25:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fqQRX5nFzz2yft;
	Tue, 07 Apr 2026 09:25:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775517928;
	cv=none; b=Fyvib1puD5NNGlPyx1jhDYzPOB4dDb7ucYCfQA3hx17xko2SQDVjlGFsZOgRf45k8spbL8ecaQTCw8K5PlJ25mIx5zE3CO0HBguuRfExyS8l2VMPtNeuhrKJIO00ZJ9+fLsEd95Qvv72aNsN5KSd9wl1kwUOhYUxiTNrsjDmR49ns9VcbWmWwuvUvDy2SFg1pANvafp581I2+xXahHEoGxrTFsdArISa1zvDgQu5q7mNYTXwcHxc5ovp07tI5MpaD4zIUcNGcpwax36378AeHsC0UyPm2ekF+sFFXJfprrmXxFcjy1YaGHhvQUX129Yr/G0KqvAjietP/47JM2Y8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775517928; c=relaxed/relaxed;
	bh=e+LsTmUaKDUP6TtbtpmsofePBR8TWMvjJHv9+/xi4nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjOwBC4SQ2xwUJAEj2+10rD+CII5C/6ZgaOUnS1b/LE8MEKXvm+pcg4pTeKdDAAmFS2V6PbBpIht1F/NqtFOzzVCVSspTmB2NduDoiCdYE2PYAbJ1m8EC2mfod+FxHcpIwUIyM1Lad6gF4APHDsaOcpYEVd4kzWIkCz/zIsNeBvgDf7HDo4rpBZkV63kkb0iJ0zfnb3jp8UDx6M5i2DsIqR31hQulwRCOLyjfUoyfdHCWzqDOJ9nTBG7vsDclAI4nawgpr99c2TXQiwTFb1A+JhPTtAkNvDb1usQl/2M6CY0kzZFMMBhM7VbUetwO6M1mJGH7pYIE2zPf2v9UQwczA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J51YEBaC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J51YEBaC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1332.google.com (mail-dy1-x1332.google.com [IPv6:2607:f8b0:4864:20::1332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fqQRW0H6Zz2xNT
	for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Apr 2026 09:25:26 +1000 (AEST)
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2ce102afb0aso2630030eec.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Apr 2026 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775517923; x=1776122723; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+LsTmUaKDUP6TtbtpmsofePBR8TWMvjJHv9+/xi4nY=;
        b=J51YEBaCA+bUN38q3XXwMl21y97zWG5ODUEZhkKNQusDnDyZ323wmziB9eBSPBPGih
         LxsA74yXTRkqXHiCe8NunyctS9PeCoXYWchGeDgpjRbkcgnodIiEqXg8AJUhIHyzNIa8
         yQtstMnnwR9jfHpMMUj2qHwroIcCbgmBeXY6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517923; x=1776122723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+LsTmUaKDUP6TtbtpmsofePBR8TWMvjJHv9+/xi4nY=;
        b=gKpI8DJUXRpPV4OmxzdA14YIujosIYdUE8YxOjLTgftkmrxO7VS1fZ+lm2HK60+64H
         aqaC3nnlhtp6DDQSZ8P/JexJEFe0AUxII75JMeUPV7Y3yvZRErgH0djHNSMJXJ8TgJcz
         pJcyr45XeQEiMOR2HG49QnhagFFhlFcRHiz5gG/JtwR4ZA+yGU8Q51o5D76tMTXh4ch1
         B2hICUS2ypaerpetHKEG1zRIeVAn5USFdh5DjQvnK3ilnQkD0BI/lMbxu8ZF4obXgrF1
         w+dnEjtWTPd6o6GpPLZSB384W94CmHerLeD+M3ZXqhXvZV4yFd6kCtCyyL5/IkK/Fckl
         hEJA==
X-Forwarded-Encrypted: i=1; AJvYcCV35seswBo7n6mv8L8M+uixm+g8K1HIdyMbJ5hH6c2FcCSyvwTUMcHCIK0yPNXTpx2D40hJa0aXDWNpef4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbhGeYvJlPJN9rmMbnN/g9uXcQ6ND7VlBJpWV7/1ovOAluHX8J
	dx9iLjUzefN3PTMc42GEdCuu2zJ3pOFFJRlNqH+UekJ/oGp6RHLFMS5rdDATRynSlw==
X-Gm-Gg: AeBDievhoeCXQ0DpjU2cAn8165FbZUVbH2vo2Mclr2GlgHXOuOdZBkzz8YWUCKu/cJG
	jGXQfnQ9mxUR27iRGR5iT5ysFtxEdy56nULzQmJNXiVlU0RAcs/mr+/7IUCdmD4ilYocJkE354F
	my8z7dO9hD4+LEPqR97Gkc8WDNZPrn7KoVXeMv0cAN0WeC8CMUnZPLIEt7cc17lyyiHx/TqqGrS
	sY/zHn9qHX092WlIIjs7//dchAU1Xw1eFzo8uUHb+ISdwHO8ubAZk00jgERwuhvJvLX7LZwQEuZ
	zXTH4IcwORE8mhVo3qky2BgxcCcBLONdUny0ThixvqGqeDZQZmX6OlGk8WsNLcBI/A6+hA7sFZ4
	Ppo6Xk9RCrsIWMRWCrHPHH5kaxUMotO2SagOiOh5CXcG/Vo6FmBYG0jcoRby7pbZo2VkXsdRWyV
	W0AW0OnN4rqvvB4+74hEn7ywC1m/1DZoPdz4hkElLx7UT0ZteAOnBUD8GAruS1kVZYs1grMGmzz
	IQphwb+RooeSaOkXcii
X-Received: by 2002:a05:7300:818c:b0:2c7:3a7:c7b1 with SMTP id 5a478bee46e88-2cbf9503916mr7679632eec.1.1775517923360;
        Mon, 06 Apr 2026 16:25:23 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:c071:3b78:5a5:824a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm14730975eec.0.2026.04.06.16.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:25:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	maz@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frank.Li@kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	alex@ghiti.fr,
	alexander.stein@ew.tq-group.com,
	andre.przywara@arm.com,
	andrew@codeconstruct.com.au,
	andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	astewart@tektelic.com,
	bhelgaas@google.com,
	brgl@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	chleroy@kernel.org,
	davem@davemloft.net,
	david@kernel.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	driver-core@lists.linux.dev,
	gbatra@linux.ibm.com,
	gregory.clement@bootlin.com,
	hkallweit1@gmail.com,
	iommu@lists.linux.dev,
	jirislaby@kernel.org,
	joel@jms.id.au,
	joro@8bytes.org,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kuba@kernel.org,
	lenb@kernel.org,
	lgirdwood@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	m.szyprowski@samsung.com,
	maddy@linux.ibm.com,
	mani@kernel.org,
	miko.lenczewski@arm.com,
	mpe@ellerman.id.au,
	netdev@vger.kernel.org,
	npiggin@gmail.com,
	osalvador@suse.de,
	oupton@kernel.org,
	pabeni@redhat.com,
	palmer@dabbelt.com,
	peter.ujfalusi@gmail.com,
	peterz@infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	sebastian.hesselbarth@gmail.com,
	tglx@kernel.org,
	tsbogend@alpha.franken.de,
	vgupta@kernel.org,
	vkoul@kernel.org,
	will@kernel.org,
	willy@infradead.org,
	yangyicong@hisilicon.com,
	yeoreum.yun@arm.com
Subject: [PATCH v5 0/9] driver core: Fix some race conditions
Date: Mon,  6 Apr 2026 16:22:53 -0700
Message-ID: <20260406232444.3117516-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ozlabs.ru,kernel.org,google.com,lst.de,arm.com,intel.com,chromium.org,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,tektelic.com,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,samsung.com,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	TAGGED_FROM(0.00)[bounces-3840-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:stern@rowland.harvard.edu,m:aik@ozlabs.ru,m:johan@kernel.org,m:edumazet@google.com,m:leon@kernel.org,m:hch@lst.de,m:robin.murphy@arm.com,m:maz@kernel.org,m:aleksander.lobakin@intel.com,m:saravanak@kernel.org,m:dianders@chromium.org,m:akpm@linux-foundation.org,m:Frank.Li@kernel.org,m:jgg@ziepe.ca,m:alex@ghiti.fr,m:alexander.stein@ew.tq-group.com,m:andre.przywara@arm.com,m:andrew@codeconstruct.com.au,m:andrew@lunn.ch,m:andriy.shevchenko@linux.intel.com,m:aou@eecs.berkeley.edu,m:ardb@kernel.org,m:astewart@tektelic.com,m:bhelgaas@google.com,m:brgl@kernel.org,m:broonie@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:david@kernel.org,m:devicetree@vger.kernel.org,m:dmaengine@vger.kernel.org,m:driver-core@lists.linux.dev,m:gbatra@linux.ibm.com,m:gregory.clement@bootlin.com,m:hkallweit1@gmail.com,m:iommu@lists.linux.dev,m:jirislaby@kernel.org,m:joel@jms.id.au,m:joro@
 8bytes.org,m:kees@kernel.org,m:kevin.brodsky@arm.com,m:kuba@kernel.org,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linux-acpi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-cxl@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-serial@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-usb@vger.kernel.org,m:linux@armlinux.org.uk,m:linuxppc-dev@lists.ozlabs.org,m:m.szyprowski@samsung.com,m:maddy@linux.ibm.com,m:mani@kernel.org,m:miko.lenczewski@arm.com,m:mpe@ellerman.id.au,m:netdev@vger.kernel.org,m:npiggin@gmail.com,m:osalvador@suse.de,m:oupton@kernel.org,m:pabeni@redhat.com,m:palmer@dabbelt.com,m:peter.ujfalusi@gmail.com,m:peterz@infradead.org,m:pjw@kernel.org,m:robh@kernel.org,m:sebastian.hesselbarth@gmail.com,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:vgupta@kernel.org,m:vkoul@kernel.org,m:will@kernel.org,m
 :willy@infradead.org,m:yangyicong@hisilicon.com,m:yeoreum.yun@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[86];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 541283A81CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The main goal of this series is to fix the observed bug talked about
in the first patch ("driver core: Don't let a device probe until it's
ready"). That patch fixes a problem that has been observed in the real
world and could land even if the rest of the patches are found
unacceptable or need to be spun.

That said, during patch review Danilo correctly pointed out that many
of the bitfield accesses in "struct device" are unsafe. I added a
bunch of patches in the series to address each one.

Danilo said he's most worried about "can_match", so I put that one
first. After that, I tried to transition bitfields to flags in reverse
order to when the bitfield was added.

Even if transitioning from bitfields to flags isn't truly needed for
correctness, it seems silly (and wasteful of space in struct device)
to have some in bitfields and some as flags. Thus I didn't spend time
for each bitfield showing that it's truly needed for correctness.

Transition was done semi manually. Presumably someone skilled at
coccinelle could do a better job, but I just used sed in a heavy-
handed manner and then reviewed/fixed the results, undoing anything my
script got wrong. My terrible/ugly script was:

var=can_match
caps="${var^^}"
for f in $(git grep -l "[>\.]${var}[^1-9_a-zA-Z\[]"); do
  echo $f
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} = true/set_bit(DEV_FLAG_${caps}, \&\\1->flags)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} = true/dev_set_${caps}(\&\\1)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} = false/clear_bit(DEV_FLAG_${caps}, \&\\1->flags)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} = false/dev_clear_${caps}(\&\\1)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} = \([^;]*\)/assign_bit(DEV_FLAG_${caps}, \&\\1->flags, \\2)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} = \([^;]*\)/dev_assign_${caps}(\&\\1, \\2)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var}\([^1-9_a-zA-Z\[]\)/test_bit(DEV_FLAG_${caps}, \&\\1->flags)\\2/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var}\([^1-9_a-zA-Z\[]\)/dev_${caps}(\&\\1)\\2/" "$f"
done

From v3 to v4, I transitioned to accessor functions with another ugly
sed script. I had git format the old patches, then transformed them
with:

for f in *.patch; do
  echo $f
  sed -i~ -e "s/test_and_set_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_test_and_set_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/test_and_set_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_test_and_set_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/test_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/test_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/set_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_set_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/set_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_set_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/clear_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags)/dev_clear_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/clear_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags)/dev_clear_\\L\\1(\\2)/" "$f"
  sed -i~ -e "s/assign_bit(DEV_FLAG_\([^,]*\), \&\(.*\)->flags, \(.*\))/dev_assign_\\L\\1(\\2, \\3)/" "$f"
  sed -i~ -e "s/assign_bit(DEV_FLAG_\([^,]*\), \(.*\)\.flags, \(.*\))/dev_assign_\\L\\1(\\2, \\3)/" "$f"
done

...and then did a few manual touchups for spacing.

I only marked the first patch as a "Fix" since it is the only one
fixing observed problems. Other patches could be considered fixes too
if folks want.

I tested the first patch in the series backported to kernel 6.6 on the
Pixel phone that was experiencing the race. I added extra printouts to
make sure that the problem was hitting / addressed. The rest of the
patches are tested with allmodconfig with arm32, arm64, ppc, and
x86. I boot tested on an arm64 Chromebook running mainline.

Changes in v5:
- ready_to_prove => ready_to_probe typo
- device_lock() while calling dev_set_ready_to_probe()
- Add comment before "can_match = true" from Danilo.
- undef __create_dev_flag_accessors

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- Use a new "flags" bitfield
- Add missing \n in probe error message

Changes in v2:
- Instead of adjusting the ordering, use "ready_to_probe" flag

Douglas Anderson (9):
  driver core: Don't let a device probe until it's ready
  driver core: Replace dev->can_match with dev_can_match()
  driver core: Replace dev->dma_iommu with dev_dma_iommu()
  driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
  driver core: Replace dev->dma_ops_bypass with dev_dma_ops_bypass()
  driver core: Replace dev->state_synced with dev_state_synced()
  driver core: Replace dev->dma_coherent with dev_dma_coherent()
  driver core: Replace dev->of_node_reused with dev_of_node_reused()
  driver core: Replace dev->offline + ->offline_disabled with accessors

 arch/arc/mm/dma.c                             |   4 +-
 arch/arm/mach-highbank/highbank.c             |   2 +-
 arch/arm/mach-mvebu/coherency.c               |   2 +-
 arch/arm/mm/dma-mapping-nommu.c               |   4 +-
 arch/arm/mm/dma-mapping.c                     |  28 ++--
 arch/arm64/kernel/cpufeature.c                |   2 +-
 arch/arm64/mm/dma-mapping.c                   |   2 +-
 arch/mips/mm/dma-noncoherent.c                |   2 +-
 arch/powerpc/kernel/dma-iommu.c               |   8 +-
 .../platforms/pseries/hotplug-memory.c        |   4 +-
 arch/riscv/mm/dma-noncoherent.c               |   2 +-
 drivers/acpi/scan.c                           |   2 +-
 drivers/base/core.c                           |  55 +++++---
 drivers/base/cpu.c                            |   4 +-
 drivers/base/dd.c                             |  36 ++++--
 drivers/base/memory.c                         |   2 +-
 drivers/base/pinctrl.c                        |   2 +-
 drivers/base/platform.c                       |   2 +-
 drivers/dma/ti/k3-udma-glue.c                 |   6 +-
 drivers/dma/ti/k3-udma.c                      |   6 +-
 drivers/iommu/dma-iommu.c                     |   9 +-
 drivers/iommu/iommu.c                         |   5 +-
 drivers/net/pcs/pcs-xpcs-plat.c               |   2 +-
 drivers/of/device.c                           |   6 +-
 drivers/pci/of.c                              |   2 +-
 drivers/pci/pwrctrl/core.c                    |   2 +-
 drivers/regulator/bq257xx-regulator.c         |   2 +-
 drivers/regulator/rk808-regulator.c           |   2 +-
 drivers/tty/serial/serial_base_bus.c          |   2 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c      |   2 +-
 include/linux/device.h                        | 122 ++++++++++++------
 include/linux/dma-map-ops.h                   |   6 +-
 include/linux/dma-mapping.h                   |   2 +-
 include/linux/iommu-dma.h                     |   3 +-
 kernel/cpu.c                                  |   4 +-
 kernel/dma/mapping.c                          |  12 +-
 mm/hmm.c                                      |   2 +-
 37 files changed, 218 insertions(+), 142 deletions(-)

-- 
2.53.0.1213.gd9a14994de-goog


